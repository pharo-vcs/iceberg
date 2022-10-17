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
		'checkedIceNodes'
	],
	#category : #'Iceberg-TipUI-View-Branch'
}

{ #category : #private }
IceTipDiffSelectingPanel >> activateItem: iceNode [
		
	checkedIceNodes add: iceNode.
	iceNode children isEmptyOrNil ifTrue: [ ^ self ].

	iceNode allChildrenDo: [ :child |
		checkedIceNodes add: child ].

	self refreshCheckbox

]

{ #category : #initialization }
IceTipDiffSelectingPanel >> changeListColumn [

	^ SpCompositeTableColumn new
		addColumn: (SpCheckBoxTableColumn new
			beNotExpandable;
			evaluated: [ :iceNode | checkedIceNodes includes: iceNode ];
			onActivation: [ :iceNode | self activateItem: iceNode ];
			onDeactivation: [ :iceNode | self deactivateItem: iceNode ];
			yourself);
		addColumn: (SpImageTableColumn new
			beNotExpandable;
			evaluated: [ :each | each value icon ];
			yourself);
		addColumn: self changeDescriptionColumn;
		yourself
]

{ #category : #private }
IceTipDiffSelectingPanel >> deactivateItem: iceNode [
		
	checkedIceNodes remove: iceNode.
	iceNode children isEmptyOrNil ifTrue: [ ^ self ].

	iceNode allChildrenDo: [ :child |
		checkedIceNodes remove: child ifAbsent: [  ] ].

	self refreshCheckbox.
]

{ #category : #initialization }
IceTipDiffSelectingPanel >> initialize [

	super initialize.
	checkedIceNodes := Set new.
	self model treeRoots do: [ :root |
		checkedIceNodes add: root.
		root allChildrenDo: [ :child | checkedIceNodes add: child ] ]

]

{ #category : #initialization }
IceTipDiffSelectingPanel >> initializeTree [

	super initializeTree.
	iceNodesTree 
		bindKeyCombination: Character space asKeyCombination 
		toAction: [ self toggleActivationItem: iceNodesTree selectedItem ]
]

{ #category : #accessing }
IceTipDiffSelectingPanel >> refresh [

	super refresh.
	self model treeRoots do: [ :root |
		root withAllChildrenDo: [ :each | checkedIceNodes add: each ] ]
]

{ #category : #accessing }
IceTipDiffSelectingPanel >> refreshCheckbox [
	"Refresh after a checkbox state has changed. When a node with children changes this state, all children might change too. That's the reason of this special refresh. When a leave node changed such state, this refresh is redundant."

	iceNodesTree refresh
]

{ #category : #accessing }
IceTipDiffSelectingPanel >> selectedItems [

	^ checkedIceNodes
]

{ #category : #private }
IceTipDiffSelectingPanel >> toggleActivationItem: iceNode [

	(checkedIceNodes includes: iceNode)
		ifTrue: [ self deactivateItem: iceNode ]
		ifFalse: [ self activateItem: iceNode ]

	
]
