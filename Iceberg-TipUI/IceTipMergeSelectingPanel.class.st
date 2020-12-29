Class {
	#name : #IceTipMergeSelectingPanel,
	#superclass : #IceTipDiffPanel,
	#instVars : [
		'codePanel',
		'checkedIceNodes'
	],
	#category : #'Iceberg-TipUI-View'
}

{ #category : #specs }
IceTipMergeSelectingPanel class >> defaultSpec [

	<spec: #default>
	^ SpBoxLayout newHorizontal
		add: #iceNodesTree width: 200;
		add:
			(SpBoxLayout newVertical
				add: #diffPanel;
				add: #codePanel;
				yourself );
		yourself
]

{ #category : #accessing }
IceTipMergeSelectingPanel >> basicRefresh [

	super basicRefresh.
	self refreshCodePanel.
]

{ #category : #initialization }
IceTipMergeSelectingPanel >> changeListColumn [

	^ SpCompositeTableColumn new
		addColumn:
			(SpCheckBoxTableColumn new
				width: 20;
				evaluated: [ :iceNode | checkedIceNodes includes: iceNode ];
				onActivation: [ :iceNode |
					checkedIceNodes add: iceNode.
					iceNode value selectLeft.
					iceNode notEmpty ifTrue: [
						iceNode allChildrenDo: [ :child | checkedIceNodes add: child ].
						self basicRefresh ] ];
				onDeactivation: [ :iceNode |
					checkedIceNodes remove: iceNode.
					iceNode value selectRight.
					iceNode notEmpty ifTrue: [
						iceNode allChildrenDo: [ :child |
							checkedIceNodes remove: child ifAbsent: [  ] ].
						self basicRefresh ].
					 ]);
		addColumn:
			(SpImageTableColumn new
				width: 20;
				evaluated: [ :each | each value chosenOperation icon ];
				yourself);
		addColumn: self changeDescriptionColumn;
		yourself
]

{ #category : #accessing }
IceTipMergeSelectingPanel >> codePanel [

	^ codePanel
]

{ #category : #private }
IceTipMergeSelectingPanel >> entryRemoved: ann [

	self refresh
]

{ #category : #initialization }
IceTipMergeSelectingPanel >> initialize [

	super initialize.
	self subscribeToAnnouncements.
	checkedIceNodes := Set new.
	self model treeRoots do: [ :root | 
		root withAllChildrenDo: [ :child | 
			checkedIceNodes add: child.
			child value isConflict ifTrue: [ child value selectLeft ] ] ]
]

{ #category : #initialization }
IceTipMergeSelectingPanel >> initializeCodePanel [

	codePanel text: ''
]

{ #category : #initialization }
IceTipMergeSelectingPanel >> initializePresenters [

	super initializePresenters.
	codePanel := self newCode.
	self initializeCodePanel
]

{ #category : #'private factory' }
IceTipMergeSelectingPanel >> newChangeTreeDataSource [

	^ IceTipTreeSelectingDataSource new
		tool: self;
		rootForItems: self model treeRoots;
		childrenBlock: [ :data | data children ];
		icon: [ :each | each value icon ];
		format: #description;
		selectAll;
		yourself
]

{ #category : #accessing }
IceTipMergeSelectingPanel >> refresh [

	super refresh.
	self model treeRoots
		do: [ :root | 
			checkedIceNodes add: root.
			root allChildrenDo: [ :child | checkedIceNodes add: child ] ];
		refreshCodePanel 
]

{ #category : #private }
IceTipMergeSelectingPanel >> refreshCodePanel [

	| visitor mergeNode |
	visitor := IceNodeCodeDisplayVistor onCodePresenter: codePanel.
	mergeNode := iceNodesTree selectedItem value.
	mergeNode
		ifNil: [ codePanel text: '' ]
		ifNotNil: [ mergeNode accept: visitor ]
]

{ #category : #accessing }
IceTipMergeSelectingPanel >> selectedItems [

	^ checkedIceNodes
]

{ #category : #'event handling' }
IceTipMergeSelectingPanel >> selectionChanged [

	super selectionChanged.
	self refreshCodePanel.
]

{ #category : #initialize }
IceTipMergeSelectingPanel >> subscribeToAnnouncements [

	self announcer
		when: IceTipDiffEntryRemoved 
		send: #entryRemoved:
		to: self
]
