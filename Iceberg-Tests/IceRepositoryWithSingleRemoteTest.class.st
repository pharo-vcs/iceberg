Class {
	#name : 'IceRepositoryWithSingleRemoteTest',
	#superclass : 'IceAbstractTestCase',
	#category : 'Iceberg-Tests-Common',
	#package : 'Iceberg-Tests',
	#tag : 'Common'
}

{ #category : 'testing' }
IceRepositoryWithSingleRemoteTest class >> isAbstract [

	^ self == IceRepositoryWithSingleRemoteTest
]

{ #category : 'tests-fetch' }
IceRepositoryWithSingleRemoteTest >> testAfterFetchingARepositoryTracksRemoteBranch [

	self repository fetch.
	self assert: self repository remoteTrackedBranches notEmpty
]

{ #category : 'tests-fetch' }
IceRepositoryWithSingleRemoteTest >> testBeforeFetchingARepositoryHasNoRemoteTrackedBranches [

	self assert: self repository remoteTrackedBranches isEmpty
]

{ #category : 'tests-fetch' }
IceRepositoryWithSingleRemoteTest >> testFetchUpdatesTrackedRemoteBranch [

	| newCommit remoteTrackedBranches |
	self remoteRepository workingCopy addPackageNamed: 'AnotherPackage'.
	newCommit := self remoteRepository commitWithMessage: 'Another commit message'.

	self repository fetch.
	remoteTrackedBranches := self repository remoteTrackedBranches.
	self assert: remoteTrackedBranches size equals: 1.
	self assert: remoteTrackedBranches anyOne commit equals: newCommit
]

{ #category : 'tests-checkout' }
IceRepositoryWithSingleRemoteTest >> testLocalBranchDoesNotTrackARemoteBranchBeforeFetching [

	"We commit to force the creation of the local branch"
	self repository workingCopy addPackageNamed: self packageName1.
	self repository commitWithMessage: 'Initial commit'.
		
	self deny: (self repository branchNamed: self remoteBranchName) tracksRemoteBranch.
]

{ #category : 'tests-checkout' }
IceRepositoryWithSingleRemoteTest >> testLocalCheckedOutBranchIsEqualsToHEAD [

	"We commit to force the creation of the local branch"
	self repository workingCopy addPackageNamed: self packageName1.
	self repository commitWithMessage: 'Initial commit'.

	self assert: (self repository branchNamed: self repository head name) equals: self repository head.
]

{ #category : 'tests-push' }
IceRepositoryWithSingleRemoteTest >> testPushPushesTags [

	(self repository isKindOf: IceMemoryRepository)
		ifTrue: [ 
			self flag: #toFix.
			^ self skip ].

	self repository pull.
	self repository createTag: 'exampleTag'.
	self repository pushTo: self remote.	
	
	self assert: (self remoteRepository tagNames includes: 'exampleTag')
]

{ #category : 'tests-fetch' }
IceRepositoryWithSingleRemoteTest >> testRemoteTrackedBranchHasSameNameAsRemoteBranch [

	self repository fetch.
	self assert: self repository remoteTrackedBranches anyOne shortname equals: self remoteBranchName
]

{ #category : 'tests-push' }
IceRepositoryWithSingleRemoteTest >> testRepositoryHasIncomingCommits [

	self assert: self repository hasIncomingCommits
]

{ #category : 'tests-push' }
IceRepositoryWithSingleRemoteTest >> testRepositoryHasNoMoreIncomingCommitsAfterPull [

	self repository pull.
	self deny: self repository hasIncomingCommits
]

{ #category : 'tests-push' }
IceRepositoryWithSingleRemoteTest >> testRepositoryHasNoOutgoingCommits [

	self deny: self repository hasOutgoingCommits
]

{ #category : 'tests-pull' }
IceRepositoryWithSingleRemoteTest >> testRepositoryPullDoesFetchAndMergeFromOrigin [

	self repository pull.
	self assert: self repository head commit equals: self remoteRepository head commit.
]

{ #category : 'tests-pull' }
IceRepositoryWithSingleRemoteTest >> testRepositoryPullFromBranchThatDoesNotHaveACorrespondingRemoteBranchDoesNothing [

	| prePullCommit |
	self repository createBranch: 'temp'.
	self repository workingCopy addPackageNamed: 'AnotherPackage'.
	prePullCommit := self repository commitWithMessage: 'Another commit message'.
	
	self repository pullFrom: self remote.
	
	self assert: self repository head commit equals: prePullCommit.
]

{ #category : 'tests-pull' }
IceRepositoryWithSingleRemoteTest >> testRepositoryPullFromUnbornBranchThatDoesNotHaveACorrespondingRemoteBranchDoesNothing [

	| prePullCommit |
	self repository createBranch: 'temp'.
	
	prePullCommit := self repository head commit.
	self repository pull.
	
	self assert: self repository head commit equals: prePullCommit.
]

{ #category : 'tests-fetch' }
IceRepositoryWithSingleRemoteTest >> testWithoutFetchTrackedRemoteBranchIsNotUpdated [

	| newCommit |
	self repository fetch.
	
	self remoteRepository checkoutAllPackages.
	self remoteRepository workingCopy addPackageNamed: 'AnotherPackage'.
	newCommit := self remoteRepository commitWithMessage: 'Another commit message'.
	
	self assert: self repository remoteTrackedBranches anyOne commit equals: newCommit ancestors anyOne
]
