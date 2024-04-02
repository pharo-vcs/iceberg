Class {
	#name : 'IceGitTestFactory',
	#superclass : 'IceAbstractTestFactory',
	#category : 'Iceberg-Tests-Git',
	#package : 'Iceberg-Tests',
	#tag : 'Git'
}

{ #category : 'initialization' }
IceGitTestFactory class >> setUp [

	^ self new setUp
]

{ #category : 'initialization' }
IceGitTestFactory >> defaultRemoteUrl [

	^ self remoteFileUrl asString
]

{ #category : 'initialization' }
IceGitTestFactory >> ensureRemoteRepository [
	| remoteRepository |
	remoteRepository := self remoteFileUrl asFileReference exists
		ifTrue: [ IceRepositoryCreator new
				location: self remoteFileUrl asFileReference;
				addLocalRepository ]
		ifFalse: [ IceRepositoryCreator new
				location: self remoteFileUrl asFileReference;
				createNewRepositoryNamed: self remoteFileUrl segments last ].
	remoteRepository
		workingCopy: (IceRingWorkingCopy fromWorkingCopy: remoteRepository workingCopy).
	^ remoteRepository
]

{ #category : 'testing' }
IceGitTestFactory >> isGit [
	
	^ true
]

{ #category : 'initialization' }
IceGitTestFactory >> location [
	
	^ FileLocator imageDirectory / 'test'
]

{ #category : 'initialization' }
IceGitTestFactory >> newBareRepositoryNamed: projectName withSubdirectory: aSubdirectory [
	| repository |
	(self location / projectName) ensureDeleteAll.
	repository := IceRepositoryCreator new
		location: self location / projectName;
		subdirectory: aSubdirectory;
		beBare;
		createNewRepositoryNamed: projectName.

	(OSEnvironment current at: 'CI' ifAbsent: [ 'false' ]) asLowercase
		= 'true'
		ifTrue: [ Transcript
				show: 'Setting user information for CI';
				cr.
			IceGitCommand
				in: repository location
				execute: {'config' . '--global' . 'user.email' . '"iceberg@pharo.org"'}.
			IceGitCommand
				in: repository location
				execute: {'config' . '--global' . 'user.name' . '"Iceberg CI"'} ].
	repository
		workingCopy: (IceRingWorkingCopy fromWorkingCopy: repository workingCopy).
	^ repository
]

{ #category : 'initialization' }
IceGitTestFactory >> newRemoteNamed: aName toRepository: aRepository [

	^ IceGitRemote name: aName url: aRepository location resolve asUrl asString
]

{ #category : 'initialization' }
IceGitTestFactory >> newRepositoryNamed: projectName withSubdirectory: aSubdirectory [
	| repository |
	(self location / projectName) ensureDeleteAll.
	repository := IceRepositoryCreator new
		location: self location / projectName;
		subdirectory: aSubdirectory;
		createNewRepositoryNamed: projectName.
	(OSEnvironment current at: 'CI' ifAbsent: [ 'false' ]) asLowercase = 'true'
		ifTrue: [
			IceGitCommand
				in: repository location
				execute: {'config' . '--global' . 'user.email' . '"iceberg@pharo.org"'}.
			IceGitCommand
				in: repository location
				execute: {'config' . '--global' . 'user.name' . '"Iceberg CI"'} ].
	repository
		workingCopy: (IceRingWorkingCopy fromWorkingCopy: repository workingCopy).
	^ repository
]

{ #category : 'initialization' }
IceGitTestFactory >> remoteFileUrl [
	
	^ (IceLibgitRepository repositoriesLocation / 'remote') resolve asUrl.
]

{ #category : 'initialization' }
IceGitTestFactory >> tearDownWithRepository: aRepository [

	aRepository ifNotNil: [
		aRepository free.
		Smalltalk garbageCollect.
		[ aRepository location ifNotNil: #ensureDeleteAll ]
			on: CannotDeleteFileException
			do: [ "On windows it is possible we need to finalize everything before deleting the files. We do not do it directly to avoid to lose too much speed"
				Smalltalk garbageCollect.
				aRepository location ifNotNil: #ensureDeleteAll ] ].
	self remoteFileUrl asFileReference ensureDeleteAll
]
