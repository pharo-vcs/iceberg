Class {
	#name : #IceTipMergeSelectingPanel,
	#superclass : #IceTipDiffPanel,
	#instVars : [
		'selectedItems',
		'codePanel'
	],
	#category : #'Iceberg-TipUI-View'
}

{ #category : #specs }
IceTipMergeSelectingPanel class >> defaultSpec [
	<spec: #default>
	^ SpBoxLayout newHorizontal
		add: #changeList width: 200;
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
				evaluated: [ :item | selectedItems includes: item ];
				onActivation: [ :item | 
					selectedItems add: item.
					item value selectLeft.
					item children isEmptyOrNil
						ifFalse: [ item allChildrenDo: [ :child | selectedItems add: child ].
							self basicRefresh ] ];
				onDeactivation: [ :item | 
					selectedItems remove: item.
					item value selectRight.
					item children isEmptyOrNil
						ifFalse: [ item
								allChildrenDo: [ :child | selectedItems remove: child ifAbsent: [  ] ].
							self basicRefresh ].
					 ]);
		addColumn:
			(SpImageTableColumn new
				width: 20;
				evaluated: [ :each | each value chosenOperation icon ];
				yourself);
		addColumn:
			(SpStringTableColumn new
				evaluated: [ :each | each definition name ];
				yourself);
		yourself
]

{ #category : #accessing }
IceTipMergeSelectingPanel >> codePanel [
	^codePanel 
]

{ #category : #accessing }
IceTipMergeSelectingPanel >> codePanel: aCodePresenter [
codePanel := aCodePresenter 
]

{ #category : #private }
IceTipMergeSelectingPanel >> entryRemoved: ann [
	self refresh
]

{ #category : #initialization }
IceTipMergeSelectingPanel >> initialize [
	super initialize.
	self subscribeToAnnouncements.
	selectedItems := Set new.
	self model treeRoots
		do: [ :root | 
			root
				allNodesDo: [ :child | 
					selectedItems add: child.
					child value isConflict
						ifTrue: child value selectLeft ] ]
]

{ #category : #initialization }
IceTipMergeSelectingPanel >> initializeCodePanel [
codePanel text: ''.
]

{ #category : #initialization }
IceTipMergeSelectingPanel >> initializeWidgets [ 
super initializeWidgets.
codePanel := self newCode.
self initializeCodePanel.
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
			selectedItems add: root.
			root allChildrenDo: [ :child | selectedItems add: child ] ];
		refreshCodePanel 
]

{ #category : #'as yet unclassified' }
IceTipMergeSelectingPanel >> refreshCodePanel [
	| visitor mergeNode |
	visitor := IceNodeCodeDisplayVistor onCodePresenter: codePanel.
	mergeNode := changeList selectedItem value.
	mergeNode
		ifNil: [ codePanel text: '' ]
		ifNotNil: [ mergeNode accept: visitor ]
]

{ #category : #accessing }
IceTipMergeSelectingPanel >> selectedItems [
	^selectedItems
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
