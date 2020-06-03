"
I'm a panel (that will be part of a dialog) to perform actions on existing panels. 
Actions themselves needs to be defined by my children.
"
Class {
	#name : #IceTipExistingBranchPanel,
	#superclass : #IceTipBranchPanel,
	#instVars : [
		'branchesList',
		'title',
		'icon'
	],
	#category : #'Iceberg-TipUI-View-Branch'
}

{ #category : #specs }
IceTipExistingBranchPanel class >> defaultSpec [
	<spec: #default>
	
	^ SpBoxLayout newHorizontal 
		add: #branchesList;
		yourself 
]

{ #category : #accessing }
IceTipExistingBranchPanel class >> icon [
	^ self iconNamed: #branch
]

{ #category : #accessing }
IceTipExistingBranchPanel class >> order [
	^ 30
]

{ #category : #specs }
IceTipExistingBranchPanel class >> title [
	^ 'Local branches'
]

{ #category : #initialization }
IceTipExistingBranchPanel >> branchModels [
	^ self model branchModels
]

{ #category : #accessing }
IceTipExistingBranchPanel >> branchesList [
	^ branchesList
]

{ #category : #accessing }
IceTipExistingBranchPanel >> branchesList: anObject [
	branchesList := anObject
]

{ #category : #accessing }
IceTipExistingBranchPanel >> icon [
	^ icon ifNil: [ super icon ]
]

{ #category : #accessing }
IceTipExistingBranchPanel >> icon: anIcon [
	icon := anIcon
]

{ #category : #initialization }
IceTipExistingBranchPanel >> initializeBranchesList [
	branchesList 
		addColumn: (( SpStringTableColumn evaluated: #shortDescriptionWithDecoration));
		items: 	self model branchModels.
	"
	We would prefere to have this implementation but for now we have a bug with the caches because #branchModels return the same cache used by the datasource but not #defaultBranchSelection. If we correct that later we can clean the code bellow.
	
	self model defaultBranchSelection ifNotNil: [ :branchModel | branchesList widget selectRowIndex: (dataSource elements indexOf: branchModel) ]."
	self model branchModels
		detect: #isHead
		ifFound: [ :head | branchesList selectItem: head ]
		ifNone: [ self model hasBranches
			ifTrue: [ branchesList selectIndex: 1 ] ]

]

{ #category : #initialization }
IceTipExistingBranchPanel >> initializeWidgets [
	branchesList := self newTable.
	self initializeBranchesList.
	
	self focusOrder 
		add: self branchesList
]

{ #category : #initialization }
IceTipExistingBranchPanel >> newBranchListDataSource [
	^ IceTipDataSource new 
		tool: self;
		elements: self model branchModels;
		yourself.
]

{ #category : #accessing }
IceTipExistingBranchPanel >> selectedBranch [
	| index |
	^ self branchesList selection selectedItem
]

{ #category : #accessing }
IceTipExistingBranchPanel >> title [
	^ title ifNil: [ self model name ]
]

{ #category : #accessing }
IceTipExistingBranchPanel >> title: aString [
	title := aString
]

{ #category : #accessing }
IceTipExistingBranchPanel >> validate [
	self selectedBranch ifNil: [ IceError signal: 'Please select a branch to checkout.' ]
]
