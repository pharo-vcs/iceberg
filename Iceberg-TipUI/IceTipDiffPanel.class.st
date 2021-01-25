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
		'diffPanel',
		'iceNodesTree'
	],
	#category : #'Iceberg-TipUI-View'
}

{ #category : #specs }
IceTipDiffPanel class >> defaultSpec [

	^ SpPanedLayout newHorizontal
		  position: 25 percent;
		  add: #iceNodesTree;
		  add: #diffPanel;
		  yourself
]

{ #category : #'instance creation' }
IceTipDiffPanel class >> onDiff: aDiff [

	^ self on: (IceTipCommitDiffModel on: aDiff)
]

{ #category : #accessing }
IceTipDiffPanel >> basicRefresh [

	self resetDiffContents.
	iceNodesTree
		roots: self model treeRoots;
		expandAll
]

{ #category : #initialization }
IceTipDiffPanel >> changeDescriptionColumn [

	^ SpStringTableColumn new
		  evaluated: [ :each | each definition name ];
		  yourself
]

{ #category : #initialization }
IceTipDiffPanel >> changeListColumn [

	^ SpCompositeTableColumn new
		addColumn:
			(SpImageTableColumn new
				width: 20;
				evaluated: [ :each | each value icon ];
				yourself);
		addColumn: self changeDescriptionColumn;
		yourself

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

{ #category : #private }
IceTipDiffPanel >> entryRemoved: ann [

	self refresh
]

{ #category : #'accessing ui' }
IceTipDiffPanel >> iceNodesTree [

	^ iceNodesTree
]

{ #category : #initialization }
IceTipDiffPanel >> initialize [

	super initialize.
	self subscribeToAnnouncements.
]

{ #category : #initialization }
IceTipDiffPanel >> initializeDiffPanel [

	diffPanel showOptions: false
]

{ #category : #initialization }
IceTipDiffPanel >> initializePresenters [

	super initializePresenters.
	iceNodesTree := self newTreeTable.
	diffPanel := self instantiate: SpDiffPresenter.

	self initializeTree.
	self initializeDiffPanel.

	self basicRefresh

]

{ #category : #initialization }
IceTipDiffPanel >> initializeTree [

	iceNodesTree
		addColumn: self changeListColumn;
		children: [ :each | each children ];
		whenSelectionChangedDo: [ self selectionChanged ].

]

{ #category : #accessing }
IceTipDiffPanel >> leftLabel: aString [

	diffPanel leftLabel: aString.
]

{ #category : #accessing }
IceTipDiffPanel >> model [

	^ model
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

	diffPanel rightLabel: aString
]

{ #category : #accessing }
IceTipDiffPanel >> selectedItem [

	^ iceNodesTree selectedItem
]

{ #category : #'event handling' }
IceTipDiffPanel >> selectionChanged [

	| itemValue |
	itemValue := iceNodesTree selectedItem value.
	itemValue ifNotNil: [ 
		self
			diffContentsLeft: itemValue rightContents
			right: itemValue leftContents ]
]

{ #category : #initialization }
IceTipDiffPanel >> setModelBeforeInitialization: anObject [

	model := anObject
]

{ #category : #initialize }
IceTipDiffPanel >> subscribeToAnnouncements [

	self announcer
		when: IceTipDiffEntryRemoved 
		send: #entryRemoved:
		to: self	
]

{ #category : #specs }
IceTipDiffPanel >> titleForWindow [

	^ 'Diff'
]
