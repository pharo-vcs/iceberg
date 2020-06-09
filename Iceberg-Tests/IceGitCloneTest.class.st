Class {
	#name : #IceGitCloneTest,
	#superclass : #IceAbstractTestCase,
	#instVars : [
		'oldProviderType'
	],
	#category : #'Iceberg-Tests-Git'
}

{ #category : #running }
IceGitCloneTest >> newFixture [

	^ IceNotYetClonedRepositoryFixture inGit
]

{ #category : #tests }
IceGitCloneTest >> setUp [

	super setUp.
	oldProviderType := IceCredentialsProvider providerType.
	IceCredentialsProvider providerType: IceNonInteractiveCredentialsProvider.
]

{ #category : #tests }
IceGitCloneTest >> tearDown [

	IceCredentialsProvider providerType: oldProviderType.
	super tearDown.
]

{ #category : #tests }
IceGitCloneTest >> testCloneErrorRemovesLocation [

	fixture ensureRemoteRepository.

	self should: [IceGitClone new
		location: fixture location;
		url: 'bad url';
		execute] raise: IceGenericError.
		
	self deny: fixture location exists
]

{ #category : #tests }
IceGitCloneTest >> testClonedRepositoryIsGitClone [

	fixture ensureRemoteRepository.

	IceGitClone new
		location: fixture location;
		url: fixture factory defaultRemoteUrl;
		execute.
		
	self assert: (fixture location / '.git') exists
]

{ #category : #tests }
IceGitCloneTest >> testLocationAlreadyExistsThrowsException [
	
	| action |
	
	fixture ensureRemoteRepository.	
	fixture location resolve ensureCreateDirectory.
	
	action := IceGitClone new
				location: fixture location;
				url: fixture factory defaultRemoteUrl;
				yourself. 
				
	self should: [ action execute ] raise: IceCloneLocationAlreadyExists
]

{ #category : #tests }
IceGitCloneTest >> testLocationDoesNotInitiallyExist [

	self deny: fixture location exists
]

{ #category : #tests }
IceGitCloneTest >> testLocationExistsAfterClone [

	fixture ensureRemoteRepository.

	IceGitClone new
		location: fixture location;
		url: fixture factory defaultRemoteUrl;
		execute.
		
	self assert: fixture location exists
]

{ #category : #tests }
IceGitCloneTest >> testRemoteDoesNotExistsShouldThrowException [

	self isCI ifTrue: [ self skip ].

	self should: [ IceGitClone new
				location: fixture location;
				url: 'https://google.com/guillep/doesNotExist111.git';
				execute ] raise: IceCloneRemoteNotFound
]
