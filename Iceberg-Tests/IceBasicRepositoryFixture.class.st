Class {
	#name : 'IceBasicRepositoryFixture',
	#superclass : 'IceNotYetClonedRepositoryFixture',
	#instVars : [
		'repository',
		'subdirectory'
	],
	#category : 'Iceberg-Tests-Common-Fixtures',
	#package : 'Iceberg-Tests',
	#tag : 'Common-Fixtures'
}

{ #category : 'initialization' }
IceBasicRepositoryFixture class >> inGit [

	^ self new
		factory: IceGitTestFactory new;
		yourself
]

{ #category : 'initialization' }
IceBasicRepositoryFixture class >> inMemory [

	^ self new
		factory: IceInMemoryTestFactory new;
		yourself
]

{ #category : 'private' }
IceBasicRepositoryFixture >> deleteAllForcingClose [
	
	self repository free. 
	super deleteAllForcingClose
]

{ #category : 'initialization' }
IceBasicRepositoryFixture >> initialize [
	super initialize.
	subdirectory := ''.
]

{ #category : 'initialization' }
IceBasicRepositoryFixture >> newRemoteNamed: aName [

	^ factory newRemoteNamed: aName toRepository: repository
]

{ #category : 'accessing' }
IceBasicRepositoryFixture >> repository [
	^ repository
]

{ #category : 'running' }
IceBasicRepositoryFixture >> setUp [

	super setUp.
	repository := factory newRepositoryNamed: projectName withSubdirectory: self subdirectory
]

{ #category : 'running' }
IceBasicRepositoryFixture >> subdirectory [
	
	^ subdirectory
]

{ #category : 'running' }
IceBasicRepositoryFixture >> subdirectory: aSubdirectory [
	
	subdirectory := aSubdirectory
]

{ #category : 'running' }
IceBasicRepositoryFixture >> tearDown [

	factory tearDownWithRepository: repository.
	super tearDown
]
