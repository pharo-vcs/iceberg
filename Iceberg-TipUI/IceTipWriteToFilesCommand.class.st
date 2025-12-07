"
Syncs the image changes with the file system. Ensures that all changes to classes and methods are reflected in the Git repository’s working directory. It does not execute any staging (git add) nor commits.
"
Class {
	#name : 'IceTipWriteToFilesCommand',
	#superclass : 'IceTipRepositoryCommand',
	#category : 'Iceberg-TipUI-Commands',
	#package : 'Iceberg-TipUI',
	#tag : 'Commands'
}

{ #category : 'default' }
IceTipWriteToFilesCommand class >> defaultDescription [

	^ 'Writes all changes made to classes and methods to the Git working directory, without staging or committing them.'
]

{ #category : 'default' }
IceTipWriteToFilesCommand class >> defaultName [

	^ 'Write to files'
]

{ #category : 'testing' }
IceTipWriteToFilesCommand >> canBeExecuted [

	^ self repositoryModel isNotNil and: [ self isRepositoryMissing not ]
]

{ #category : 'executing' }
IceTipWriteToFilesCommand >> execute [

	IceTipWriteToFilesAction new
		onSuccess: [
			self inform: 'Image changes synched to Git''s working directory' ];
		executeWithContext: context
]

{ #category : 'accessing' }
IceTipWriteToFilesCommand >> iconName [

	^ #rightSide
]
