Class {
	#name : #IceWithRemoteAndLocalCommitFixture,
	#superclass : #IceBasicRepositoryFixture,
	#instVars : [
		'remote',
		'remoteBranchName'
	],
	#category : #'Iceberg-Tests-Common-Fixtures'
}

{ #category : #accessing }
IceWithRemoteAndLocalCommitFixture >> remote [
	^ remote
]

{ #category : #accessing }
IceWithRemoteAndLocalCommitFixture >> remoteBranchName [
	^ remoteBranchName ifNil: [ remoteBranchName  := 'master' ]
]

{ #category : #accessing }
IceWithRemoteAndLocalCommitFixture >> remoteBranchName: aBranchName [
	
	remoteBranchName := aBranchName
]

{ #category : #accessing }
IceWithRemoteAndLocalCommitFixture >> remoteRepository [
	^ remoteRepository
]

{ #category : #running }
IceWithRemoteAndLocalCommitFixture >> setUp [
	super setUp.
	remoteRepository := self ensureRemoteRepository.
	remote := self
		newRemoteNamed: 'origin'
		toRepository: remoteRepository.
	remoteRepository checkoutBranch: self remoteBranchName.
	remoteRepository workingCopy addPackageNamed: self packageName1.
	remoteRepository commitWithMessage: 'Initial commit'.
	repository checkoutBranch: self remoteBranchName.
	repository addRemote: remote.
	
	repository workingCopy addPackageNamed: self packageName2.
	repository commitWithMessage: 'Initial local commit'.
	
	remote fetch
]
