"
Command that opens a dialog to checkout a (new or already existing) branch.
"
Class {
	#name : 'IceTipCheckoutBranchCommand',
	#superclass : 'IceTipRepositoryCommand',
	#category : 'Iceberg-TipUI-Commands',
	#package : 'Iceberg-TipUI',
	#tag : 'Commands'
}

{ #category : 'accessing - defaults' }
IceTipCheckoutBranchCommand class >> defaultDescription [

	^ 'Checkout a new or existing branch.'
]

{ #category : 'accessing - defaults' }
IceTipCheckoutBranchCommand class >> defaultName [

	^ 'Checkout branch'
]

{ #category : 'accessing - defaults' }
IceTipCheckoutBranchCommand class >> defaultToolbarItemName [

	^ 'Branch'
]

{ #category : 'testing' }
IceTipCheckoutBranchCommand >> canBeExecuted [

	^ super canBeExecuted and: [ self isRepositoryMissing not]
]

{ #category : 'executing' }
IceTipCheckoutBranchCommand >> execute [

	(IceTipCheckoutBranchDialog 
		newApplication: context application 
		model: self repositoryModel)
		asDialogWindow 
			centeredRelativeTo: context window;
			open
]

{ #category : 'accessing' }
IceTipCheckoutBranchCommand >> iconName [

	^ #branch
]
