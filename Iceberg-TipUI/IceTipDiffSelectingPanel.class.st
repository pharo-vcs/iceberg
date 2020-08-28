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
		addColumn: self changeDescriptionColumn;
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
	"Refresh after a checkbox state has changed. When a node with children changes this state, all children might change too. That's the reason of this special refresh. When a leave node changed such state, this refresh is redundant."

	self flag: #fix. "Low level access"
	changeList adapter widget refresh
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
