"
Syncs the image changes with the file system. Ensures that all changes to classes and methods are reflected in the Git repository’s working directory. It does not execute any staging (git add) nor commits.
"
Class {
	#name : 'IceTipSyncToFilesCommand',
	#superclass : 'IceTipRepositoryCommand',
	#category : 'Iceberg-TipUI-Commands',
	#package : 'Iceberg-TipUI',
	#tag : 'Commands'
}

{ #category : 'default' }
IceTipSyncToFilesCommand class >> defaultDescription [

	^ 'Updates the file system to match the current state of the Pharo image. Ensures that all changes to classes and methods are reflected in the Git repository’s working directory, without staging or committing them.'
]

{ #category : 'default' }
IceTipSyncToFilesCommand class >> defaultName [

	^ 'SyncToFiles'
]

{ #category : 'testing' }
IceTipSyncToFilesCommand >> canBeExecuted [

	^ self isRepositoryOperational
]

{ #category : 'executing' }
IceTipSyncToFilesCommand >> execute [

	IceTipSyncToFilesAction new
		onSuccess: [
			self inform: 'Image changes synched to GitHub''s working directory' ];
		executeWithContext: context
]

{ #category : 'accessing' }
IceTipSyncToFilesCommand >> iconName [

	^ #smallSave
]
