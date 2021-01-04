"
Action to start the creation of a new branch from the selected commit.
Then checkout the selected branch.
"
Class {
	#name : #IceTipCheckoutNewBranchCommand,
	#superclass : #IceTipCommand,
	#category : #'Iceberg-TipUI-Commands'
}

{ #category : #accessing }
IceTipCheckoutNewBranchCommand class >> defaultDescription [

	^ 'Create a new branch from the selected commit and switch to it'
]

{ #category : #activation }
IceTipCheckoutNewBranchCommand class >> defaultName [

	^ 'Branch...'
]

{ #category : #execution }
IceTipCheckoutNewBranchCommand >> execute [

	(IceTipCheckoutNewBranchPanel on: self repositoryModel)
		commitish: self selectedCommit;
		withResultDo: [ :branch | branch checkout ];
		openDialogWithSpec
]

{ #category : #accessing }
IceTipCheckoutNewBranchCommand >> iconName [

	^ #branch
]

{ #category : #accessing }
IceTipCheckoutNewBranchCommand >> selectedCommit [

	^ self item entity
]
