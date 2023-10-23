Class {
	#name : 'IceLibGitIndexTestCase',
	#superclass : 'IceMergeTest',
	#category : 'Iceberg-Tests-Git',
	#package : 'Iceberg-Tests',
	#tag : 'Git'
}

{ #category : 'running' }
IceLibGitIndexTestCase >> assertIndexIsClean [

	| diff |
	diff := (LGitDiff of: self repository repositoryHandle)
		diffTree: self repository head commit libgitCommit tree toIndex: self repository repositoryHandle index;
		yourself.

	self assert: diff numberOfDeltas equals: 0
]

{ #category : 'running' }
IceLibGitIndexTestCase >> newFixture [
	^ IceBasicRepositoryFixture inGit
]

{ #category : 'running' }
IceLibGitIndexTestCase >> testGitIndexIsCleanAfterCheckoutBranch [

	"If we checkout a branch, git's index should be clean.
	Otherwise, it may mess up later commits"
	
	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy addPackageNamed: self packageName2.
	self repository commitWithMessage: 'First commit'.
	
	self repository createBranch: 'to_come_back'.
	
	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting'
		inPackage: self packageName1 asSymbol.
	self repository commitWithMessage: 'Change 1'.
	
	(self repository branchNamed: 'master') checkout.
	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting2'
		inPackage: self packageName1 asSymbol.
	self repository commitWithMessage: 'Change 2'.

	(self repository branchNamed: 'to_come_back') checkout.

	self assertIndexIsClean
]

{ #category : 'tests' }
IceLibGitIndexTestCase >> testImageAndHeadBehindMergeCommitShouldMergeInImageAndAdvanceHead [

	super testImageAndHeadBehindMergeCommitShouldMergeInImageAndAdvanceHead.
	self assertIndexIsClean.
]

{ #category : 'tests' }
IceLibGitIndexTestCase >> testImageAndHeadInverseMergeDivergingCommitShouldCreateMergeCommitAdvanceHeadAndImage [

	super testImageAndHeadInverseMergeDivergingCommitShouldCreateMergeCommitAdvanceHeadAndImage.
	self assertIndexIsClean.
]

{ #category : 'tests' }
IceLibGitIndexTestCase >> testImageAndHeadMergeDivergingCommitShouldCreateMergeCommitAdvanceHeadAndImage [

	super testImageAndHeadMergeDivergingCommitShouldCreateMergeCommitAdvanceHeadAndImage.
	self assertIndexIsClean.
]

{ #category : 'tests' }
IceLibGitIndexTestCase >> testImageBehindHeadShouldOnlyMergeInImage [

	super testImageBehindHeadShouldOnlyMergeInImage.
	self assertIndexIsClean.
]

{ #category : 'tests' }
IceLibGitIndexTestCase >> testMergeAheadImageCommitShouldFastForwardHEAD [

	super testMergeAheadImageCommitShouldFastForwardHEAD.
	self assertIndexIsClean.
]

{ #category : 'tests' }
IceLibGitIndexTestCase >> testMergeCommitInHistoryShouldDoNothing [

	super testMergeCommitInHistoryShouldDoNothing.
	self assertIndexIsClean.
]

{ #category : 'tests' }
IceLibGitIndexTestCase >> testMergeImageReferenceCommitInHistoryShouldDoNothing [

	super testMergeImageReferenceCommitInHistoryShouldDoNothing.
	self assertIndexIsClean.
]

{ #category : 'tests' }
IceLibGitIndexTestCase >> testTrimergeShouldRaiseError [

	super testTrimergeShouldRaiseError.
	self assertIndexIsClean.
]
