"
Command that opens a dialog to select a branch to merge in the current merge
"
Class {
	#name : 'IceTipMergeCommand',
	#superclass : 'IceTipRepositoryCommand',
	#category : 'Iceberg-TipUI-Commands',
	#package : 'Iceberg-TipUI',
	#tag : 'Commands'
}

{ #category : 'accessing - defaults' }
IceTipMergeCommand class >> defaultDescription [

	^ 'Merge a given branch into your current branch.'
]

{ #category : 'accessing - defaults' }
IceTipMergeCommand class >> defaultName [

	^ 'Merge to current'
]

{ #category : 'testing' }
IceTipMergeCommand >> canBeExecuted [

	^ self isRepositoryOperational
]

{ #category : 'executing' }
IceTipMergeCommand >> execute [
	
	(IceTipMergeBranchDialogPresenter 
		newApplication: context application 
		model: self repositoryModel) 
		asDialogWindow 
			centeredRelativeTo: context window;
			open
]

{ #category : 'accessing' }
IceTipMergeCommand >> iconName [

	^ #merge
]
