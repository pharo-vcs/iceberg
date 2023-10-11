Class {
	#name : 'IceWithRemoteFixture',
	#superclass : 'IceBasicRepositoryFixture',
	#instVars : [
		'remote',
		'remoteBranchName'
	],
	#category : 'Iceberg-Tests-Common-Fixtures',
	#package : 'Iceberg-Tests',
	#tag : 'Common-Fixtures'
}

{ #category : 'accessing' }
IceWithRemoteFixture >> remote [
	^ remote
]

{ #category : 'accessing' }
IceWithRemoteFixture >> remoteBranchName [
	^ remoteBranchName ifNil: [ remoteBranchName  := 'master' ]
]

{ #category : 'accessing' }
IceWithRemoteFixture >> remoteBranchName: aBranchName [
	
	remoteBranchName := aBranchName
]

{ #category : 'accessing' }
IceWithRemoteFixture >> remoteRepository [
	^ remoteRepository
]

{ #category : 'running' }
IceWithRemoteFixture >> setUp [
	super setUp.
	remoteRepository := self ensureRemoteRepository.
	remote := self
		newRemoteNamed: 'origin'
		toRepository: remoteRepository.
	remoteRepository checkoutBranch: self remoteBranchName.
	remoteRepository workingCopy addPackageNamed: self packageName1.
	remoteRepository commitWithMessage: 'Initial commit'.
	repository checkoutBranch: self remoteBranchName.
	repository addRemote: remote
]
