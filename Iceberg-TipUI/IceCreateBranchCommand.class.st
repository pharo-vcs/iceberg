"
I'm a command to create a new branch from a commit. 
this is usefull in the case of committing changes in unsync repositories (so you open a branch and you commit there)
"
Class {
	#name : 'IceCreateBranchCommand',
	#superclass : 'IceRepositoryCommand',
	#category : 'Iceberg-TipUI-Commands',
	#package : 'Iceberg-TipUI',
	#tag : 'Commands'
}

{ #category : 'execute' }
IceCreateBranchCommand >> execute [
	| selection |
	
	context application newRequest
		title: 'Create new branch';
		label: 'Please provide the name of the new branch to be created';
		openModalWithParent: context window.
	selection isEmptyOrNil ifTrue: [ ^ self ].
	self repository createBranch: selection.
	self beSuccess
]
