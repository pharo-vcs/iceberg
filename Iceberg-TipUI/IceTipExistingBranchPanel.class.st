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

{ #category : 'initialization' }
IceTipExistingBranchPanel >> branchModels [

	^ self model branchModels
]

{ #category : 'accessing - ui' }
IceTipExistingBranchPanel >> branchesList [

	^ branchesList
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
IceTipExistingBranchPanel >> iconForWindow [

	^ self icon
]

{ #category : 'initialization' }
IceTipExistingBranchPanel >> initializeBranchesList [

	branchesList
		hideColumnHeaders;
		addColumn: (SpStringTableColumn evaluated: [: branch | self shortDescriptionFor: branch ]);
		items: self model branchModels.

	self model branchModels
		detect: #isHead
		ifFound: [ :head | branchesList selectItem: head ]
		ifNone: [
		self model hasBranches ifTrue: [ branchesList selectIndex: 1 ] ].

	self flag: #pharoTodo "Instead of detecting 'isHead', we would prefer to select 'self model defaultBranchSelection' but we have a bug with the caches. The reason is that #branchModels returns the same cache used by the list but not #defaultBranchSelection."
]

{ #category : 'initialization' }
IceTipExistingBranchPanel >> initializePresenters [

	branchesList := self newTable.
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

{ #category : 'initialization' }
IceTipExistingBranchPanel >> titleForWindow [

	^ title ifNil: [ self model name ]
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
