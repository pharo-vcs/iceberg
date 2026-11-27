Class {
	#name : 'IceGitTestFactory',
	#superclass : 'IceAbstractTestFactory',
	#category : 'Iceberg-Tests-Git',
	#package : 'Iceberg-Tests',
	#tag : 'Git'
}

{ #category : 'private' }
IceGitTestFactory >> configureUserIdentityIn: aLocation [
	"libgit2 needs a git identity to commit, and the machine running the tests may not have one. Set it in the test repository itself, so the tests do not depend on the host git configuration."

	IceGitCommand in: aLocation execute: { 'config'. 'user.email'. '"iceberg@pharo.org"' }.
	IceGitCommand in: aLocation execute: { 'config'. 'user.name'. '"Iceberg Tests"' }
]

{ #category : 'initialization' }
IceGitTestFactory >> defaultRemoteUrl [

	^ self remoteFileUrl asString
]

{ #category : 'private' }
IceGitTestFactory >> ensureDeleteAll: aFileReference [
	"On Windows, libgit2 keeps the files of repositories that are not finalized yet open, so they cannot be deleted. We only collect garbage in that case, to keep the tests fast on other systems."

	[ aFileReference ensureDeleteAll ] on: CannotDeleteFileException do: [
		Smalltalk garbageCollect.
		aFileReference ensureDeleteAll ]
]

{ #category : 'accessing' }
IceGitTestFactory >> ensureRemoteRepository [

	| remoteRepository |
	remoteRepository := self remoteFileUrl asFileReference exists
		                    ifTrue: [
			                    IceRepositoryCreator new
				                    location: self remoteFileUrl asFileReference;
				                    addLocalRepository ]
		                    ifFalse: [
			                    IceRepositoryCreator new
				                    location: self remoteFileUrl asFileReference;
				                    createNewRepositoryNamed: self remoteFileUrl segments last ].
	self configureUserIdentityIn: remoteRepository location.
	remoteRepository workingCopy: (IceRingWorkingCopy fromWorkingCopy: remoteRepository workingCopy).
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

{ #category : 'private' }
IceGitTestFactory >> newBareRepositoryNamed: projectName withSubdirectory: aSubdirectory [

	| repository |
	self ensureDeleteAll: self location / projectName.
	repository := IceRepositoryCreator new
		              location: self location / projectName;
		              subdirectory: aSubdirectory;
		              beBare;
		              createNewRepositoryNamed: projectName.
	self configureUserIdentityIn: repository location.
	repository workingCopy: (IceRingWorkingCopy fromWorkingCopy: repository workingCopy).
	^ repository
]

{ #category : 'initialization' }
IceGitTestFactory >> newRemoteNamed: aName toRepository: aRepository [

	^ IceGitRemote name: aName url: aRepository location resolve asZnUrl asString
]

{ #category : 'initialization' }
IceGitTestFactory >> newRepositoryNamed: projectName withSubdirectory: aSubdirectory [

	| repository |
	self ensureDeleteAll: self location / projectName.
	repository := IceRepositoryCreator new
		              location: self location / projectName;
		              subdirectory: aSubdirectory;
		              createNewRepositoryNamed: projectName.
	self configureUserIdentityIn: repository location.
	repository workingCopy: (IceRingWorkingCopy fromWorkingCopy: repository workingCopy).
	^ repository
]

{ #category : 'initialization' }
IceGitTestFactory >> remoteFileUrl [

	^ (IceLibgitRepository repositoriesLocation / 'remote') resolve asZnUrl
]

{ #category : 'initialization' }
IceGitTestFactory >> tearDownWithRepository: aRepository [

	aRepository ifNotNil: [
		aRepository free.
		aRepository location ifNotNil: [ :location | self ensureDeleteAll: location ] ].
	self ensureDeleteAll: self remoteFileUrl asFileReference
]
