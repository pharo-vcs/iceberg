Class {
	#name : 'IceNotYetClonedRepositoryFixture',
	#superclass : 'Object',
	#instVars : [
		'factory',
		'projectName',
		'packageName1',
		'packageName2',
		'remoteRepository',
		'location'
	],
	#category : 'Iceberg-Tests-Common-Fixtures',
	#package : 'Iceberg-Tests',
	#tag : 'Common-Fixtures'
}

{ #category : 'initialization' }
IceNotYetClonedRepositoryFixture class >> inGit [

	^ self new
		factory: IceGitTestFactory new;
		yourself
]

{ #category : 'initialization' }
IceNotYetClonedRepositoryFixture class >> inMemory [

	^ self new
		factory: IceInMemoryTestFactory new;
		yourself
]

{ #category : 'private' }
IceNotYetClonedRepositoryFixture >> deleteAllForcingClose [
	"On windows it is possible we need to finalize everything before deleting the files. 
	 We do not do it directly to avoid to lose too much speed"

	Smalltalk garbageCollect.
	self location ifNotNil: #ensureDeleteAll
]

{ #category : 'initialization' }
IceNotYetClonedRepositoryFixture >> ensureRemoteRepository [
	
	^ remoteRepository := factory ensureRemoteRepository
]

{ #category : 'accessing' }
IceNotYetClonedRepositoryFixture >> factory [
	^ factory
]

{ #category : 'accessing' }
IceNotYetClonedRepositoryFixture >> factory: aFactory [

	factory := aFactory
]

{ #category : 'initialization' }
IceNotYetClonedRepositoryFixture >> initialize [
	super initialize.
	location := FileLocator imageDirectory / 'test' / UUID new asString.
	super initialize.
	packageName1 := 'IceMockPackage1'.
	packageName2 := 'IceMockPackage2'.
]

{ #category : 'testing' }
IceNotYetClonedRepositoryFixture >> isGit [
	
	^ factory isGit
]

{ #category : 'testing' }
IceNotYetClonedRepositoryFixture >> isUnbornProjectFixture [
	
	^ false
]

{ #category : 'initialization' }
IceNotYetClonedRepositoryFixture >> location [
	
	^ location
]

{ #category : 'initialization' }
IceNotYetClonedRepositoryFixture >> newRemoteNamed: aName toRepository: aRepository [

	^ factory newRemoteNamed: aName toRepository: aRepository
]

{ #category : 'accessing' }
IceNotYetClonedRepositoryFixture >> packageName1 [
	^ packageName1
]

{ #category : 'accessing' }
IceNotYetClonedRepositoryFixture >> packageName1: anObject [
	packageName1 := anObject
]

{ #category : 'accessing' }
IceNotYetClonedRepositoryFixture >> packageName2 [
	^ packageName2
]

{ #category : 'accessing' }
IceNotYetClonedRepositoryFixture >> packageName2: anObject [
	packageName2 := anObject
]

{ #category : 'running' }
IceNotYetClonedRepositoryFixture >> setUp [

	projectName := 'test-project'.
]

{ #category : 'running' }
IceNotYetClonedRepositoryFixture >> tearDown [

	[ self location ifNotNil: #ensureDeleteAll ]
		on: CannotDeleteFileException
		do: [ 
			"On windows it is possible we need to finalize everything before deleting the files. 
			 We do not do it directly to avoid to lose too much speed"
			self deleteAllForcingClose ]
]
