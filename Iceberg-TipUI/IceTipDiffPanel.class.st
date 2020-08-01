"
I'm a diff panel that shows packages/classes/methods changed in a column and a diff in the other.

I receive a model that needs to understand #elements.
also #elements answer should be a collection of elements that also understand elements.

(IceTipDiffPanel onDiff: (IceRepository registry first workingCopyDiff)) openWithSpec
"
Class {
	#name : #IceTipDiffPanel,
	#superclass : #IceTipSpPresenter,
	#instVars : [
		'model',
		'changeList',
		'diffPanel'
	],
	#category : #'Iceberg-TipUI-View'
}

{ #category : #specs }
IceTipDiffPanel class >> defaultSpec [
	<spec: #default>
	^ SpBoxLayout newHorizontal
		add: #changeList width: 200;
		add: #diffPanel;
		yourself
]

{ #category : #'instance creation' }
IceTipDiffPanel class >> onDiff: aDiff [
	^ self on: (IceTipCommitDiffModel on: aDiff)
]

{ #category : #specs }
IceTipDiffPanel class >> title [
	^ 'Diff'
]

{ #category : #accessing }
IceTipDiffPanel >> basicRefresh [
	self resetDiffContents.
	changeList roots: self model treeRoots.

	self flag: #fix. "Low level access"
	changeList adapter widget dataSource expandAll
]

{ #category : #accessing }
IceTipDiffPanel >> buildMenu [
	^ (CmdContextMenuActivation
		buildMenuInContext: self createCommandContext) asSpMenuPresenter
]

{ #category : #'accessing ui' }
IceTipDiffPanel >> changeList [
	^ changeList
]

{ #category : #'accessing ui' }
IceTipDiffPanel >> changeList: anObject [
	changeList := anObject
]

{ #category : #initialization }
IceTipDiffPanel >> changeListColumn [
			^ SpCompositeTableColumn new
				addColumn:
					(SpImageTableColumn new
						width: 20;
						evaluated: [ :each | each value icon ];
						yourself);
				addColumn:
					(SpStringTableColumn new
						evaluated: [ :each | each definition name ];
						yourself);
				yourself
]

{ #category : #private }
IceTipDiffPanel >> changeSelected [
	^ changeList selectedItem
]

{ #category : #accessing }
IceTipDiffPanel >> contextClass [
	^ IceTipDiffContext
]

{ #category : #accessing }
IceTipDiffPanel >> contextSelection [ 
	^ self changeSelected
]

{ #category : #private }
IceTipDiffPanel >> diffContentsLeft: leftString right: rightString [

	diffPanel
		"Clean the diff first, to avoid comparing old right against new left"
		leftText: '';
		rightText: '';
		"Now set all of them"
		leftText: leftString;
		rightText: rightString
]

{ #category : #'accessing ui' }
IceTipDiffPanel >> diffPanel [
	^ diffPanel
]

{ #category : #'accessing ui' }
IceTipDiffPanel >> diffPanel: anObject [
	diffPanel := anObject
]

{ #category : #initialization }
IceTipDiffPanel >> initializeChangeList [
	changeList
		addColumn: self changeListColumn;
		children: [ :each | each children ];
		roots: self model treeRoots;
		"The inversion below allow to display change properly in the SpDiffPresenter"
			whenSelectionChangedDo: [ self selectionChanged ];
			contextMenu: [ self buildMenu ].
			
	changeList whenBuiltDo: [ :ann | self basicRefresh ]
]

{ #category : #initialization }
IceTipDiffPanel >> initializeDiffPanel [
	diffPanel showOptions: false
]

{ #category : #initialization }
IceTipDiffPanel >> initializeWidgets [
	changeList := self newTreeTable.
	diffPanel := self instantiate: SpDiffPresenter.

	self initializeChangeList.
	self initializeDiffPanel.

"	changeList widget
		onAnnouncement: FTSelectionChanged
		send: #selectionChanged:
		to: self."

"	self whenBuiltDo: [ :ann | self addShortcutsTo: ann widget ]."

	self focusOrder
		add: changeList;
		add: diffPanel
]

{ #category : #accessing }
IceTipDiffPanel >> leftLabel: aString [ 
	"This allows us to be compatible with old pharo versions"
	(diffPanel respondsTo: #leftLabel:) ifFalse: [ ^ self ].
	diffPanel leftLabel: aString.
]

{ #category : #accessing }
IceTipDiffPanel >> model [

	^ model
]

{ #category : #accessing }
IceTipDiffPanel >> model: anObject [
	model := anObject.
	self refresh
]

{ #category : #'private factory' }
IceTipDiffPanel >> newContext [
	^ super newContext
	repositoryModel: self model repositoryModel;
	yourself
]

{ #category : #'private factory' }
IceTipDiffPanel >> newContextWithSelection: anObject [
	^ self newContext
	item: anObject;
	yourself
]

{ #category : #accessing }
IceTipDiffPanel >> refresh [
	self model reset.
	self basicRefresh
	
]

{ #category : #private }
IceTipDiffPanel >> resetDiffContents [
	self diffContentsLeft: '' right: ''
]

{ #category : #accessing }
IceTipDiffPanel >> rightLabel: aString [ 
	"This allows us to be compatible with old pharo versions"
	(diffPanel respondsTo: #leftLabel:) ifFalse: [ ^ self ].
	diffPanel rightLabel: aString
]

{ #category : #'event handling' }
IceTipDiffPanel >> selectionChanged [
	| itemValue |
	itemValue := changeList selectedItem value.
	itemValue ifNotNil: [ 
		self
			diffContentsLeft: itemValue rightContents
			right: itemValue leftContents ]
]

{ #category : #'event handling' }
IceTipDiffPanel >> selectionChanged: ann [
	| element |
	(ann newSelectedIndexes reject: [ :each | each = 0 ])
		ifNotEmpty: [ :indexes | 
			element := changeList widget dataSource realElementAt: indexes first.
			self
				diffContentsLeft: element value rightContents
				right: element value leftContents ]
		ifEmpty: [ self resetDiffContents ]
]

{ #category : #initialization }
IceTipDiffPanel >> setModelBeforeInitialization: anObject [
	model := anObject
]
