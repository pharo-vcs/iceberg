"
Command that discard all changes in the repository
"
Class {
	#name : #IceTipDiscardChangesCommand,
	#superclass : #IceTipRepositoryCommand,
	#category : #'Iceberg-TipUI-Commands'
}

{ #category : #accessing }
IceTipDiscardChangesCommand class >> defaultDescription [

	^ 'Discard all changes in this working copy.'
]

{ #category : #accessing }
IceTipDiscardChangesCommand class >> defaultName [

	^ 'Discard all'
]

{ #category : #testing }
IceTipDiscardChangesCommand >> canBeExecuted [

	^ self isRepositoryMissing not and: [ 
		| aCommit |
		aCommit := self repository workingCopy referenceCommit.
		aCommit isCollection not and: [ aCommit isUnknownCommit not ] ]
]

{ #category : #execution }
IceTipDiscardChangesCommand >> execute [

	self repositoryModel discardChanges
]

{ #category : #accessing }
IceTipDiscardChangesCommand >> iconName [

	^ #refresh
]

{ #category : #testing }
IceTipDiscardChangesCommand >> shouldBeDisplayedOnRightSideInToolbar [

	^ true
]
