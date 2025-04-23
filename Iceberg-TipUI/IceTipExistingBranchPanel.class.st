"
I'm a panel (that will be part of a dialog) to perform actions on existing panels. 
Actions themselves needs to be defined by my children.
"
Class {
	#name : 'IceTipExistingBranchPanel',
	#superclass : 'IceTipBranchPanel',
	#instVars : [
		'branchesList',
		'title',
		'icon'
	],
	#category : 'Iceberg-TipUI-View-Branch',
	#package : 'Iceberg-TipUI',
	#tag : 'View-Branch'
}

{ #category : 'adding' }
IceTipExistingBranchPanel >> addBranchWithSegments: segments branch: branch toHierarchy: hierarchy [

	| groupName group |
	groupName := segments first.
	group := hierarchy
		         detect: [ :item | item itemName = groupName ]
		         ifNone: [
		         hierarchy add: (IceTipBranchItem itemName: groupName branch: branch) ].

	segments size > 1 ifTrue: [
			self
				addBranchWithSegments: segments allButFirst
				branch: branch
				toHierarchy: group branches ]
]

{ #category : 'initialization' }
IceTipExistingBranchPanel >> branchModels [

	^ self model branchModels
]

{ #category : 'accessing - ui' }
IceTipExistingBranchPanel >> branchesList [

	^ branchesList
]

{ #category : 'creation' }
IceTipExistingBranchPanel >> createBranchHierarchy: branchModels [

	| hierarchy |
	hierarchy := OrderedCollection new.
	branchModels do: [ :branch |
			| segments |
			segments := branch entity name splitOn: '/'.

			self
				addBranchWithSegments: segments
				branch: branch
				toHierarchy: hierarchy ].

	^ hierarchy sorted: #itemName ascending
]

{ #category : 'layout' }
IceTipExistingBranchPanel >> defaultLayout [

	^ SpBoxLayout newLeftToRight
		  add: branchesList;
		  yourself
]

{ #category : 'accessing - ui' }
IceTipExistingBranchPanel >> icon [

	^ icon ifNil: [ self iconNamed: #branch ]
]

{ #category : 'accessing - ui' }
IceTipExistingBranchPanel >> icon: anIcon [

	icon := anIcon
]

{ #category : 'initialization' }
IceTipExistingBranchPanel >> initializeBranchesList [

	branchesList
		hideColumnHeaders;
		display: [ :node | node displayName ];
		displayIcon: [ :node | self iconNamed: node iconName ];
		expandAll;
		enableSearch;
		children: [ :node | node branches ];
		roots: (self createBranchHierarchy: self model branchModels);
		selectItem: branchesList roots first
]

{ #category : 'initialization' }
IceTipExistingBranchPanel >> initializePresenters [

	branchesList := self newTree.
	self initializeBranchesList
]

{ #category : 'accessing' }
IceTipExistingBranchPanel >> selectedBranch [

	^ self branchesList selection selectedItem
]

{ #category : 'initialization' }
IceTipExistingBranchPanel >> shortDescriptionFor: aBranch [
	aBranch isHead ifFalse: [ ^aBranch shortDescription  ].
	^aBranch shortDescription , ' (current)'
]

{ #category : 'accessing - ui' }
IceTipExistingBranchPanel >> titleForWindow: aString [

	title := aString
]

{ #category : 'accessing' }
IceTipExistingBranchPanel >> validate [

	self selectedBranch ifNil: [ 
		IceError signal: 'Please select a branch to checkout.' ]
]

{ #category : 'initialization' }
IceTipExistingBranchPanel >> windowIcon [

	^ self icon
]

{ #category : 'initialization' }
IceTipExistingBranchPanel >> windowTitle [

	^ title ifNil: [ self model name ]
]
