"
Command that opens a dialog to checkout a (new or already existing) branch.
"
Class {
	#name : #IceTipCheckoutBranchCommand,
	#superclass : #IceTipRepositoryCommand,
	#category : #'Iceberg-TipUI-Commands'
}

{ #category : #accessing }
IceTipCheckoutBranchCommand class >> defaultDescription [

	^ 'Checkout a new or existing branch.'
]

{ #category : #accessing }
IceTipCheckoutBranchCommand class >> defaultName [

	^ 'Checkout branch'
]

{ #category : #accessing }
IceTipCheckoutBranchCommand class >> defaultToolbarItemName [

	^ 'Branch'
]

{ #category : #testing }
IceTipCheckoutBranchCommand >> canBeExecuted [

	^ self isRepositoryMissing not
]

{ #category : #execution }
IceTipCheckoutBranchCommand >> execute [

	(IceTipCheckoutBranchDialog on: self repositoryModel)
		openDialogWithSpec
]

{ #category : #accessing }
IceTipCheckoutBranchCommand >> iconName [

	^ #branch
]
