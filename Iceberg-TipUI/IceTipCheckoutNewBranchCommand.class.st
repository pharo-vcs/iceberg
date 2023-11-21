"
Action to start the creation of a new branch from the selected commit.
Then checkout the selected branch.
"
Class {
	#name : 'IceTipCheckoutNewBranchCommand',
	#superclass : 'IceTipCommand',
	#category : 'Iceberg-TipUI-Commands',
	#package : 'Iceberg-TipUI',
	#tag : 'Commands'
}

{ #category : 'accessing - defaults' }
IceTipCheckoutNewBranchCommand class >> defaultDescription [

	^ 'Create a new branch from the selected commit and switch to it'
]

{ #category : 'accessing - defaults' }
IceTipCheckoutNewBranchCommand class >> defaultName [

	^ 'Branch...'
]

{ #category : 'executing' }
IceTipCheckoutNewBranchCommand >> execute [

	((IceTipCheckoutNewBranchPanel 
		newApplication: context application 
		model: self repositoryModel)
		commitish: self selectedCommit;
		withResultDo: [ :branch | branch checkout ])
		asDialogWindow 
			centeredRelativeTo: context window;
			open
]

{ #category : 'accessing' }
IceTipCheckoutNewBranchCommand >> iconName [

	^ #branch
]

{ #category : 'accessing' }
IceTipCheckoutNewBranchCommand >> selectedCommit [

	^ self item entity
]
