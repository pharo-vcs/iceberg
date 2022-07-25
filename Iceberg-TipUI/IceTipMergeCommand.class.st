"
Command that opens a dialog to select a branch to merge in the current merge
"
Class {
	#name : #IceTipMergeCommand,
	#superclass : #IceTipRepositoryCommand,
	#category : #'Iceberg-TipUI-Commands'
}

{ #category : #'accessing - defaults' }
IceTipMergeCommand class >> defaultDescription [

	^ 'Merge your current branch with another.'
]

{ #category : #'accessing - defaults' }
IceTipMergeCommand class >> defaultName [

	^ 'Merge'
]

{ #category : #testing }
IceTipMergeCommand >> canBeExecuted [

	^ self isRepositoryOperational
]

{ #category : #executing }
IceTipMergeCommand >> execute [
	
	(IceTipMergeBranchDialog 
		newApplication: context application 
		model: self repositoryModel) 
		asModalWindow 
			centeredRelativeTo: context window;
			open
]

{ #category : #accessing }
IceTipMergeCommand >> iconName [

	^ #merge
]
