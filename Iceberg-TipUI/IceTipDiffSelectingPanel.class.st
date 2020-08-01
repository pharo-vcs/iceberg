"
I'm a diff panel that shows packages/classes/methods changed in a column and a diff in the other.
I give users the possibility of select changes.  

By default, all my elements are selected on opening.

As my father, I receive a model that needs to understand #elements.
also #elements answer should be a collection of elements that also understand elements.


"
Class {
	#name : #IceTipDiffSelectingPanel,
	#superclass : #IceTipDiffPanel,
	#instVars : [
		'selectedItems'
	],
	#category : #'Iceberg-TipUI-View'
}

{ #category : #initialization }
IceTipDiffSelectingPanel >> changeListColumn [
	^ SpCompositeTableColumn new
		addColumn:
			(SpCheckBoxTableColumn new
				width: 20;
				evaluated: [ :item | selectedItems includes: item ];
				onActivation: [ :item | 
					selectedItems add: item.
					item children isEmptyOrNil
						ifFalse: [ item allChildrenDo: [ :child | selectedItems add: child ].
							self refreshCheckbox ] ];
				onDeactivation: [ :item | 
					selectedItems remove: item.
					item children isEmptyOrNil
						ifFalse: [ item
								allChildrenDo: [ :child | selectedItems remove: child ifAbsent: [  ] ].
							self refreshCheckbox. ] ]);
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
IceTipDiffSelectingPanel >> entryRemoved: ann [
	self refresh
]

{ #category : #initialization }
IceTipDiffSelectingPanel >> initialize [
	super initialize.
	self subscribeToAnnouncements.
	selectedItems := Set new.
	self model treeRoots
		do: [ :root | 
			selectedItems add: root.
			root allChildrenDo: [ :child | selectedItems add: child.]]
]

{ #category : #accessing }
IceTipDiffSelectingPanel >> refresh [
	super refresh.
	self model treeRoots
		do: [ :root | 
			selectedItems add: root.
			root allChildrenDo: [ :child | selectedItems add: child ] ]
]

{ #category : #accessing }
IceTipDiffSelectingPanel >> refreshCheckbox [
	 self basicRefresh
]

{ #category : #accessing }
IceTipDiffSelectingPanel >> selectedItems [
	^selectedItems
]

{ #category : #initialize }
IceTipDiffSelectingPanel >> subscribeToAnnouncements [
	self announcer
		when: IceTipDiffEntryRemoved 
		send: #entryRemoved:
		to: self	
]
