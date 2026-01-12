Class {
	#name : 'IceTipBranchConflictResolutionDialog',
	#superclass : 'IceTipOptionDialogPresenter',
	#instVars : [
		'existingBranch',
		'types',
		'model'
	],
	#category : 'Iceberg-TipUI-View-Branch',
	#package : 'Iceberg-TipUI',
	#tag : 'View-Branch'
}

{ #category : 'instance creation' }
IceTipBranchConflictResolutionDialog class >> onRepository: aRepository [

	^ self on: (IceTipRepositoryModel on: aRepository)
]

{ #category : 'instance creation' }
IceTipBranchConflictResolutionDialog class >> onRepository: aRepository existingBranch: aBranch [

	^ (self on: (IceTipRepositoryModel on: aRepository))
		  existingBranch: aBranch;
		  yourself
]

{ #category : 'accessing' }
IceTipBranchConflictResolutionDialog >> allTypes [

	^ types ifNil: [ types := self createConflictBranchTypes ]
]

{ #category : 'as yet unclassified' }
IceTipBranchConflictResolutionDialog >> createConflictBranchTypes [

	| allTypes |
	"Collect types new+local+remotes"
	allTypes := {
		            (IceTipCheckoutNewBranchPanel on: self model). "New branch"
		            ((IceTipCheckoutBranchPanel on: self model)
			             titleForWindow: 'Local';
			             icon: (self iconNamed: #branch);
			             yourself) } , (self model remoteModels collect: [ :each |
			             (IceTipCheckoutBranchPanel on: each)
				             titleForWindow: each name;
				             icon: (self iconNamed: #remote);
				             yourself ]) , (self model entity pluginManager checkoutBranchPanelsOnModel: self model). "Doing this because I can trigger the accept inside the panels."
	allTypes do: [ :each | each onAccept: [ self closeWindow ] ].

	^ allTypes
]

{ #category : 'actions' }
IceTipBranchConflictResolutionDialog >> doAccept [

	self selectedType doAccept
]

{ #category : 'accessing' }
IceTipBranchConflictResolutionDialog >> existingBranch: aBranch [

	existingBranch := aBranch
]

{ #category : 'accessing' }
IceTipBranchConflictResolutionDialog >> model [

	^ model
]

{ #category : 'accessing - model' }
IceTipBranchConflictResolutionDialog >> setModelBeforeInitialization: anObject [

	model := anObject
]

{ #category : 'accessing' }
IceTipBranchConflictResolutionDialog >> windowTitle [

	^ 'Resolve branch conflict'
]
