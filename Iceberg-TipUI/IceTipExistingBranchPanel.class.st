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
		         detect: [ :item |
		         (item isKindOf: Association) and: [ item key = groupName ] ]
		         ifNone: [
				         | newGroup |
				         newGroup := Association
					                     key: groupName
					                     value: OrderedCollection new.
				         hierarchy add: newGroup ].

	segments size > 2
		ifTrue: [
				self
					addBranchWithSegments: segments allButFirst
					branch: branch
					toHierarchy: group value ]
		ifFalse: [ group value add: branch ]
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

	| hierarchy groups |
	hierarchy := OrderedCollection new.
	groups := Dictionary new.
	branchModels do: [ :branch |
			| segments |
			segments := branch entity name splitOn: '/'.
			segments size > 1
				ifTrue: [
						self
							addBranchWithSegments: segments
							branch: branch
							toHierarchy: hierarchy ]
				ifFalse: [ hierarchy add: branch ] ].

	^ hierarchy
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
		display: [ :node |
				(node isKindOf: Association)
					ifTrue: [ node key ]
					ifFalse: [
							| segments |
							segments := node entity name splitOn: '/'.
							segments size > 1
								ifTrue: [ segments last ]
								ifFalse: [ node entity name ] ] ];
		expandAll;
		children: [ :node |
				(node isKindOf: Association)
					ifTrue: [
							node value sorted: [ :a :b |
										(a isKindOf: Association)
											ifTrue: [
													(b isKindOf: Association)
														ifFalse: [
															a key asLowercase <= b entity name asLowercase ]
														ifTrue: [ a key asLowercase <= b key asLowercase ] ]
											ifFalse: [
													(b isKindOf: Association)
														ifFalse: [
															a entity name asLowercase <= b entity name asLowercase ]
														ifTrue: [
															a entity name asLowercase <= b key asLowercase ] ] ] ]
					ifFalse: [ #(  ) ] ];
		roots:
			((self createBranchHierarchy: self model branchModels) sorted: [
						 :a
						 :b |
						 (a isKindOf: Association)
							 ifTrue: [
									 (b isKindOf: Association)
										 ifFalse: [ a key asLowercase <= b entity name asLowercase ]
										 ifTrue: [ a key asLowercase <= b key asLowercase ] ]
							 ifFalse: [
									 (b isKindOf: Association)
										 ifFalse: [
											 a entity name asLowercase <= b entity name asLowercase ]
										 ifTrue: [ a entity name asLowercase <= b key asLowercase ] ] ]).

	self model branchModels
		detect: #isHead 
		ifFound: [ :head | branchesList selectItem: head ]
		ifNone: [
		self model hasBranches ifTrue: [ branchesList selectPath: #( 1 ) ] ].

	self flag: #pharoTodo "Instead of detecting 'isHead', we would prefer to select 'self model defaultBranchSelection' but we have a bug with the caches. The reason is that #branchModels returns the same cache used by the list but not #defaultBranchSelection."
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
