Class {
	#name : #IceTipMergeDiffSelectingPanel,
	#superclass : #IceTipDiffPanel,
	#instVars : [
		'selectedItems'
	],
	#category : #'Iceberg-TipUI-View'
}

{ #category : #initialization }
IceTipMergeDiffSelectingPanel >> changeListColumn [
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
							self refreshCheckbox ] ];
				onDesactivation: [ :item | 
					selectedItems remove: item.
					item value selectRight.
					item children isEmptyOrNil
						ifFalse: [ item
								allChildrenDo: [ :child | selectedItems remove: child ifAbsent: [  ] ].
							self refreshCheckbox ] ]);
		addColumn:
			(SpImageTableColumn new
				width: 20;
				evaluated: [ :each | 1 halt. each value chosenOperation icon. ];
				yourself);
		addColumn:
			(SpStringTableColumn new
				evaluated: [ :each | each definition name ];
				yourself);
		yourself
]

{ #category : #private }
IceTipMergeDiffSelectingPanel >> entryRemoved: ann [
	self refresh
]

{ #category : #initialization }
IceTipMergeDiffSelectingPanel >> initialize [
	super initialize.
	self subscribeToAnnouncements.
	selectedItems := Set new.
	self model treeRoots
		do: [ :root | 
			selectedItems add: root.
			root allChildrenDo: [ :child | selectedItems add: child.]]
]

{ #category : #'private factory' }
IceTipMergeDiffSelectingPanel >> newChangeTreeDataSource [

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
IceTipMergeDiffSelectingPanel >> refresh [
	super refresh. self model treeRoots
		do: [ :root | 
			selectedItems add: root.
			root allChildrenDo: [ :child | selectedItems add: child ] ]
]

{ #category : #'as yet unclassified' }
IceTipMergeDiffSelectingPanel >> refreshCheckbox [
	 self basicRefresh
]

{ #category : #private }
IceTipMergeDiffSelectingPanel >> resetDataSource: aDataSource [
	super resetDataSource: aDataSource.
	aDataSource selectAll
]

{ #category : #accessing }
IceTipMergeDiffSelectingPanel >> selectedItems [
	^selectedItems
]

{ #category : #initialize }
IceTipMergeDiffSelectingPanel >> subscribeToAnnouncements [
	self announcer
		when: IceTipDiffEntryRemoved 
		send: #entryRemoved:
		to: self	
]
