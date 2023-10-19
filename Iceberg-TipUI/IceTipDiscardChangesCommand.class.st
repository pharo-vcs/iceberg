"
Command that discard all changes in the repository
"
Class {
	#name : 'IceTipDiscardChangesCommand',
	#superclass : 'IceTipRepositoryCommand',
	#category : 'Iceberg-TipUI-Commands',
	#package : 'Iceberg-TipUI',
	#tag : 'Commands'
}

{ #category : 'accessing - defaults' }
IceTipDiscardChangesCommand class >> defaultDescription [

	^ 'Discard all changes in this working copy.'
]

{ #category : 'accessing - defaults' }
IceTipDiscardChangesCommand class >> defaultName [

	^ 'Discard all'
]

{ #category : 'testing' }
IceTipDiscardChangesCommand >> canBeExecuted [

	^ self isRepositoryMissing not and: [ 
		| aCommit |
		aCommit := self repository workingCopy referenceCommit.
		aCommit isCollection not and: [ aCommit isUnknownCommit not ] ]
]

{ #category : 'executing' }
IceTipDiscardChangesCommand >> execute [

	(IceTipDiscardAllChangesPreviewBrowser onRepository: self repositoryModel)
		open


]

{ #category : 'accessing' }
IceTipDiscardChangesCommand >> iconName [

	^ #refresh
]

{ #category : 'testing' }
IceTipDiscardChangesCommand >> shouldBeDisplayedOnRightSideInToolbar [

	^ true
]
