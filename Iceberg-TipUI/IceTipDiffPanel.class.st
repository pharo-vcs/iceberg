"
I'm a diff panel that shows packages/classes/methods changed in a column and a diff in the other.

I receive a model that needs to understand #elements.
also #elements answer should be a collection of elements that also understand elements.

(IceTipDiffPanel onDiff: (IceRepository registry first workingCopyDiff)) openWithSpec
"
Class {
	#name : 'IceTipDiffPanel',
	#superclass : 'IceTipBrowser',
	#instVars : [
		'diffPanel',
		'iceNodesTree'
	],
	#category : 'Iceberg-TipUI-View-Branch',
	#package : 'Iceberg-TipUI',
	#tag : 'View-Branch'
}

{ #category : 'commands' }
IceTipDiffPanel class >> buildGeneralCommandGroupWith: presenter for:  aCommandGroup [

	"Nothing to add"
]

{ #category : 'commands' }
IceTipDiffPanel class >> buildSelectionCommandGroupWith: presenter for: aCommandGroup [ 
	{
		IceTipBrowseCommand.
		IceTipInspectCommand } do: [ :each |
		aCommandGroup register: (each forSpecContext: presenter)]
]

{ #category : 'instance creation' }
IceTipDiffPanel class >> onDiff: aDiff [

	^ self on: (IceTipCommitDiffModel on: aDiff)
]

{ #category : 'initialization' }
IceTipDiffPanel >> baseTreeActions [
		
	^ SpActionGroup new 
		addShortcutWith: [ :action | action 
			shortcutKey: KeyboardKey left asKeyCombination;
			action: [ self handleArrowLeft ] ];
		addShortcutWith: [ :action | action 
			shortcutKey: KeyboardKey right asKeyCombination;
			action: [ self handleArrowRight ] ];
		yourself
]

{ #category : 'accessing' }
IceTipDiffPanel >> basicRefresh [

	self resetDiffContents.
	iceNodesTree
		roots: self model treeRoots;
		expandAll
]

{ #category : 'initialization' }
IceTipDiffPanel >> changeDescriptionColumn [

	^ SpStringTableColumn new
		  evaluated: [ :each | each definition name ];
		  yourself
]

{ #category : 'initialization' }
IceTipDiffPanel >> changeListColumn [

	^ SpCompositeTableColumn new
		addColumn: (SpImageTableColumn new
			evaluated: [ :each | each value icon ];
			beNotExpandable;
			yourself);
		addColumn: self changeDescriptionColumn;
		yourself
]

{ #category : 'private' }
IceTipDiffPanel >> collapsePath: aPath [

	iceNodesTree 
		collapsePath: aPath;
		selectPath: aPath
]

{ #category : 'layout' }
IceTipDiffPanel >> defaultLayout [

	^ SpPanedLayout newLeftToRight
		  positionOfSlider: 25 percent;
		  add: iceNodesTree;
		  add: diffPanel;
		  yourself
]

{ #category : 'private' }
IceTipDiffPanel >> diffContentsLeft: leftString right: rightString [

	diffPanel
		"Clean the diff first, to avoid comparing old right against new left"
		leftText: '';
		rightText: '';
		"Now set all of them"
		leftText: leftString;
		rightText: rightString
]

{ #category : 'initialization' }
IceTipDiffPanel >> diffEntryRemoved: announcement [

	| parent |
	(parent := announcement entry parent) removeChild: announcement entry.
	"Removing all changes to a class should remove the class node too,
	unless the class definition has changed as well. Extension definitions
	may appear as an 'addition' or 'removal', but can only exist when methods
	of that class have changed. Repeat this process to check if the containing
	package no longer has any changes. Cannot remove the root node as it has
	no parent, but it's fine to just leave it there empty--though perhaps we should
	close the browser instead in that case?"
	[
	parent parent isNotNil and: [
		parent isEmpty and: [
			parent value isNoModification or: [
				parent value definition isExtensionDefinition ] ] ] ] whileTrue: [
		parent parent removeChild: parent.
		parent := parent parent ].

	self basicRefresh
]

{ #category : 'accessing - ui' }
IceTipDiffPanel >> diffPanel [

	^ diffPanel
]

{ #category : 'actions' }
IceTipDiffPanel >> doCollapseSelection [
	
	self collapsePath: iceNodesTree selection selectedPath
]

{ #category : 'actions' }
IceTipDiffPanel >> doExpandSelection [
	
	self expandPath: iceNodesTree selection selectedPath
]

{ #category : 'private' }
IceTipDiffPanel >> expandPath: aPath [

	iceNodesTree 
		expandPath: aPath;
		selectPath: aPath
]

{ #category : 'event handling' }
IceTipDiffPanel >> handleArrowLeft [

	self collapsePath: iceNodesTree selection selectedPath
]

{ #category : 'event handling' }
IceTipDiffPanel >> handleArrowRight [

	self expandPath: iceNodesTree selection selectedPath
]

{ #category : 'accessing - ui' }
IceTipDiffPanel >> iceNodesTree [

	^ iceNodesTree
]

{ #category : 'initialization' }
IceTipDiffPanel >> initialize [

	super initialize.
	self subscribeToAnnouncements
]

{ #category : 'initialization' }
IceTipDiffPanel >> initializeDiffPanel [

	diffPanel showOptions: false
]

{ #category : 'initialization' }
IceTipDiffPanel >> initializePresenters [

	iceNodesTree := self newTreeTable.
	diffPanel := self instantiate: SpDiffPresenter.

	self initializeTree.
	self initializeDiffPanel
]

{ #category : 'initialization' }
IceTipDiffPanel >> initializeTree [

	iceNodesTree
		hideColumnHeaders;
		addColumn: self changeListColumn;
		children: [ :each | each children ];
		whenSelectionChangedDo: [ self selectionChanged ];
		actions: self baseTreeActions
]

{ #category : 'accessing' }
IceTipDiffPanel >> leftLabel: aString [

	diffPanel leftLabel: aString.
]

{ #category : 'accessing - ui' }
IceTipDiffPanel >> mainList [ 

^iceNodesTree 
]

{ #category : 'accessing' }
IceTipDiffPanel >> model [

	^ model
]

{ #category : 'accessing' }
IceTipDiffPanel >> refresh [

	self model reset.
	self basicRefresh

]

{ #category : 'private' }
IceTipDiffPanel >> resetDiffContents [

	self diffContentsLeft: '' right: ''
]

{ #category : 'accessing' }
IceTipDiffPanel >> rightLabel: aString [

	diffPanel rightLabel: aString
]

{ #category : 'accessing' }
IceTipDiffPanel >> selectedItem [

	^ iceNodesTree selectedItem
]

{ #category : 'event handling' }
IceTipDiffPanel >> selectionChanged [

	| itemValue |
	itemValue := iceNodesTree selectedItem value.
	itemValue ifNotNil: [ 
		self
			diffContentsLeft: itemValue rightContents
			right: itemValue leftContents ]
]

{ #category : 'initialization' }
IceTipDiffPanel >> setModelBeforeInitialization: anObject [

	model := anObject
]

{ #category : 'initialization' }
IceTipDiffPanel >> subscribeToAnnouncements [

	self announcer
		when: IceTipDiffEntryRemoved
		send: #diffEntryRemoved:
		to: self
]

{ #category : 'initialization' }
IceTipDiffPanel >> titleForWindow [

	^ 'Diff'
]

{ #category : 'accessing - ui' }
IceTipDiffPanel >> treeActions: anActionGroup [ 

	iceNodesTree actions: (SpActionGroup new 
		add: anActionGroup beRoot;
		add: self baseTreeActions beRoot;
		yourself)
]

{ #category : 'initialization' }
IceTipDiffPanel >> updatePresenter [

	self basicRefresh
]
