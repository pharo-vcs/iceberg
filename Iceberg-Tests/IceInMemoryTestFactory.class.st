Class {
	#name : 'IceInMemoryTestFactory',
	#superclass : 'IceAbstractTestFactory',
	#category : 'Iceberg-Tests-Memory',
	#package : 'Iceberg-Tests',
	#tag : 'Memory'
}

{ #category : 'initialization' }
IceInMemoryTestFactory class >> setUp [

	^ self new setUp
]

{ #category : 'accessing' }
IceInMemoryTestFactory >> ensureRemoteRepository [
	
	^ self newRepositoryNamed: 'remoteRepo'
]

{ #category : 'testing' }
IceInMemoryTestFactory >> isGit [
	
	^ false
]

{ #category : 'initialization' }
IceInMemoryTestFactory >> newRemoteNamed: aName toRepository: remoteRepository [

	^ IceMemoryRemote
		name: aName
		remoteRepository: remoteRepository
		branchRepository: MCDictionaryRepository new
]

{ #category : 'initialization' }
IceInMemoryTestFactory >> newRepositoryNamed: projectName withSubdirectory: aSubdirectory [
	"Ignore the subdirectory in memory"
	| repository |
	repository := IceMemoryRepository new.
	repository workingCopy: (IceRingWorkingCopy fromWorkingCopy: repository workingCopy).
	^ repository
]

{ #category : 'initialization' }
IceInMemoryTestFactory >> tearDownWithRepository: aRepository [
		
	"Nothing"
]
