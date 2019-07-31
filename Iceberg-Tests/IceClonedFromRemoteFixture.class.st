Class {
	#name : #IceClonedFromRemoteFixture,
	#superclass : #IceNotYetClonedRepositoryFixture,
	#instVars : [
		'remote',
		'remoteBranchName',
		'repository',
		'pushRepository'
	],
	#category : #'Iceberg-Tests-Common-Fixtures'
}

{ #category : #accessing }
IceClonedFromRemoteFixture >> pushRepository [
	^ pushRepository
]

{ #category : #accessing }
IceClonedFromRemoteFixture >> remote [
	^ remote
]

{ #category : #accessing }
IceClonedFromRemoteFixture >> remoteBranchName [
	^ remoteBranchName ifNil: [ remoteBranchName  := 'master' ]
]

{ #category : #accessing }
IceClonedFromRemoteFixture >> remoteBranchName: aBranchName [
	
	remoteBranchName := aBranchName
]

{ #category : #accessing }
IceClonedFromRemoteFixture >> remoteRepository [
	^ remoteRepository
]

{ #category : #'as yet unclassified' }
IceClonedFromRemoteFixture >> repository [
	^ repository
]

{ #category : #running }
IceClonedFromRemoteFixture >> setUp [
	super setUp.
	remoteRepository := self ensureRemoteRepository.
	remoteRepository checkoutBranch: self remoteBranchName.
	remoteRepository workingCopy addPackageNamed: self packageName1.
	remoteRepository commitWithMessage: 'Initial commit'.

	pushRepository := factory
		newBareRepositoryNamed: 'pushRepository'
		withSubdirectory: ''.

	remote := self newRemoteNamed: 'origin' toRepository: pushRepository.
	remoteRepository addRemote: remote.
	remoteRepository pushTo: remote.
	repository := IceRepositoryCreator new
		location: self location;
		remote: remote;
		cloneRepository;
		repository.
	repository
		workingCopy: (IceRingWorkingCopy fromWorkingCopy: repository workingCopy).
	repository checkoutBranch: self remoteBranchName.

	"IceGitClone new
		location: self location;
		url: self factory defaultRemoteUrl;
		execute.
	repository := IceRepositoryCreator new.
	repository location: self location."
	repository pull
	"1 halt
	repository checkoutBranch: self remoteBranchName.
	repository addRemote: remote.
	repository workingCopy addPackageNamed: self packageName2.
	repository commitWithMessage: 'Initial local commit'."
]

{ #category : #running }
IceClonedFromRemoteFixture >> tearDown [
	factory tearDownWithRepository: repository.
	factory tearDownWithRepository: remoteRepository.
	super tearDown
]
