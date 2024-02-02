Class {
	#name : 'IceGitMergeTest',
	#superclass : 'IceMergeTest',
	#category : 'Iceberg-Tests-Git',
	#package : 'Iceberg-Tests',
	#tag : 'Git'
}

{ #category : 'running' }
IceGitMergeTest >> newFixture [
	^ IceBasicRepositoryFixture inGit
]

{ #category : 'tests' }
IceGitMergeTest >> testConflictFile [
	| fileRef branchMaster branchRemove |
	
	fileRef := self repository location / 'conflicting.txt'.
	fileRef writeStreamDo: [ :stream | stream << 'some contents' ].
	self repository index addPath: (fileRef relativeTo: self repository location).
	self repository commitWithMessage: 'first commit'.
	branchMaster := self repository branch.

	self repository checkoutBranch: 'second-branch'.
	fileRef writeStreamDo: [ :stream | stream << 'some contents from second branch' ].
	self repository index addPath: (fileRef relativeTo: self repository location).
	self repository commitWithMessage: 'change from second branch'.
	branchRemove := self repository branch.	
	
	branchMaster checkout.
	fileRef writeStreamDo: [ :stream | stream << 'some contents from first branch' ].
	self repository index addPath: (fileRef relativeTo: self repository location).
	self repository commitWithMessage: 'commit from first branch'.	
	
	self should: [ branchRemove merge ] raise: IceMergeResolutionRequest
]

{ #category : 'tests' }
IceGitMergeTest >> testMergeBinaryFileAdditionCreatesFileInWorkingCopy [
	| fileRef branchMaster newBranch |

	fileRef := self repository location / 'firstCommitFile'.
	self repository index addPath: (fileRef relativeTo: self repository location).
	self repository commitWithMessage: 'First commit'.	
	branchMaster := self repository branch.

	self repository checkoutBranch: 'add-file-branch'.
	newBranch := self repository branch.

	fileRef := self repository location / 'test-to-remove.bin'.

	fileRef binaryWriteStreamDo: [ :stream | stream nextPutAll: IceFileDefinitionTest bytesWithIlegalLeadingBytes ].
	self repository index addPath: (fileRef relativeTo: self repository location).
	self repository commitWithMessage: 'Add file'.
	

	branchMaster checkout.	
	self deny: fileRef exists.

	newBranch merge.
	self assert: fileRef exists.
]

{ #category : 'tests' }
IceGitMergeTest >> testMergeOfInnessaryMergeCommit [
	| c1 c2 c3 c4 i1  fileRef|

	"When producing a merge, sometimes Github produces a merge commit that is not necessary. 
	This merge commit includes two commits that are also included in the chain of ancestors of the head.

	Initial state:

	(c4) <-- master
	 | 
	 |	
	 | 
	 v	 
	(c3) <--(i1) <-- incoming
	 |       |
	 v       |
	(c2)     |
	 |       |
	 v       |
	(c1) <----

	Expected State:
	
	(merge)--   <-- master
	 |       |
    |       |
	 v       |
	(c4)     | 
	 |       |
	 |       |	
	 |       | 
	 v       v	 
	(c3) <--(i1) <-- incoming
	 |       |
	 v       |
	(c2)     |
	 |       |
	 v       |
	(c1) <----
		
	"

	c1 := self repository commitWithMessage: 'C1'.
	
	fileRef := self repository location / 'c2.txt'.
	fileRef writeStreamDo: [ :stream | stream << 'c2' ].
	self repository index addPath: (fileRef relativeTo: self repository location).
	c2 := self repository commitWithMessage: 'C2'.

	fileRef := self repository location / 'c3.txt'.
	fileRef writeStreamDo: [ :stream | stream << 'c3' ].
	self repository index addPath: (fileRef relativeTo: self repository location).
	c3 := self repository commitWithMessage: 'C3'.

	fileRef := self repository location / 'c4.txt'.
	fileRef writeStreamDo: [ :stream | stream << 'c4' ].
	self repository index addPath: (fileRef relativeTo: self repository location).
	c4 := self repository commitWithMessage: 'C4'.

	c3 checkout.
	self repository checkoutBranch: 'incoming'.

	i1 := self repository
		commitIndexWithMessage: 'Merge'
		andParents: {c3. c1}.
	
	self repository checkoutBranch: 'master'.
	
	i1 merge. 
	
	self assert: self repository branch commit ancestors equals: { c4. i1 }.
	self assert: self repository branch commit comment equals: 'Merge ' , i1 id.

]

{ #category : 'tests' }
IceGitMergeTest >> testMergeTextFileAdditionCreatesFileInWorkingCopy [
	| fileRef branchMaster newBranch |

	fileRef := self repository location / 'firstCommitFile'.
	self repository index addPath: (fileRef relativeTo: self repository location).
	self repository commitWithMessage: 'First commit'.	
	branchMaster := self repository branch.

	self repository checkoutBranch: 'add-file-branch'.
	newBranch := self repository branch.

	fileRef := self repository location / 'test-to-remove.txt'.
	fileRef writeStreamDo: [ :stream | stream << 'to-remove' ].
	self repository index addPath: (fileRef relativeTo: self repository location).
	self repository commitWithMessage: 'Add file'.
	

	branchMaster checkout.	
	self deny: fileRef exists.

	newBranch merge.
	self assert: fileRef exists.
]

{ #category : 'tests' }
IceGitMergeTest >> testMergeWithDirectoryRemovedOnOneBranchButNotOtherCausesConflict [
	| fileRef otherFileRef branchMaster branchRemove |
	
	fileRef := self repository location / 'directoryToRemove' / 'test-to-remove.txt'.
	fileRef parent ensureCreateDirectory.
	fileRef writeStreamDo: [ :stream | stream << 'to-remove' ].
	self repository index addPath: (fileRef relativeTo: self repository location).
	self repository commitWithMessage: 'first commit'.
	branchMaster := self repository branch.

	self repository checkoutBranch: 'remove-branch'.
	fileRef ensureDelete.
	self repository index addPath: (fileRef relativeTo: self repository location).
	self repository commitWithMessage: 'commit removed file'.
	branchRemove := self repository branch.	
	
	branchMaster checkout.
	otherFileRef := self repository location / 'directoryToRemove' / 'other-test-to-remove.txt'.
	otherFileRef parent ensureCreateDirectory.
	otherFileRef writeStreamDo: [ :stream | stream << 'to-remove' ].
	self repository index addPath: (otherFileRef relativeTo: self repository location).
	self repository commitWithMessage: 'commit 2nd file'.	

	self should: [ branchRemove merge ] raise: IceMergeResolutionRequest
]

{ #category : 'tests' }
IceGitMergeTest >> testMergeWithDirectoryRemovedWithFastForward [
	| fileRef branchMaster branchRemove |
	
	fileRef := self repository location / 'directoryToRemove' / 'test-to-remove.txt'.
	fileRef parent ensureCreateDirectory.
	fileRef writeStreamDo: [ :stream | stream << 'to-remove' ].
	
	self repository index addPath: (fileRef relativeTo: self repository location).
	self repository commitWithMessage: 'first commit'.
	branchMaster := self repository branch.

	self repository checkoutBranch: 'remove-branch'.
	fileRef ensureDelete.
	self repository index addPath: (fileRef relativeTo: self repository location).
	self repository commitWithMessage: 'commit removed file'.
	branchRemove := self repository branch.	
	
	branchMaster checkout.
	branchRemove merge.
	
	self deny: fileRef parent exists
]

{ #category : 'tests' }
IceGitMergeTest >> testMergeWithDirectoryRemovedWithMerge [
	| fileRef otherFileRef branchMaster branchRemove |
	
	fileRef := self repository location / 'directoryToRemove' / 'test-to-remove.txt'.
	fileRef parent ensureCreateDirectory.
	fileRef writeStreamDo: [ :stream | stream << 'to-remove' ].
	self repository index addPath: (fileRef relativeTo: self repository location).
	self repository commitWithMessage: 'first commit'.
	branchMaster := self repository branch.

	self repository checkoutBranch: 'remove-branch'.
	fileRef ensureDelete.
	self repository index addPath: (fileRef relativeTo: self repository location).
	self repository commitWithMessage: 'commit removed file'.
	branchRemove := self repository branch.	
	
	branchMaster checkout.
	otherFileRef := self repository location / 'other-test-to-remove.txt'.
	otherFileRef writeStreamDo: [ :stream | stream << 'to-remove' ].
	self repository index addPath: (otherFileRef relativeTo: self repository location).
	self repository commitWithMessage: 'commit 2nd file'.	
	
	branchRemove merge.
	
	self assert: otherFileRef exists.
	self deny: fileRef parent exists.
]

{ #category : 'tests' }
IceGitMergeTest >> testMergeWithEmptyIncomingCommitCreatesMergeCommit [
	| incomingBranch |

	self repository checkoutBranch: 'master'.	
	self repository workingCopy project: self repository newUnbornProject.
	self repository commitWithMessage: 'Remove project file'.

	self repository checkoutBranch: 'localBranch'.
	self repository workingCopy project: (IceBasicProject onRepository: self repository withSourceDirectory: '').
	self repository commitWithMessage: 'commit project file'.
	incomingBranch := self repository branch.
	
	self repository checkoutBranch: 'master'.	
	self repository workingCopy project: (IceBasicProject onRepository: self repository withSourceDirectory: '').
	self repository commitWithMessage: 'second commit in master'.

	incomingBranch merge.
		
	self assert: self repository workingCopy referenceCommit comment equals: 'Merge ' , incomingBranch commit id
]

{ #category : 'tests' }
IceGitMergeTest >> testMergeWithFileRemovedWithFastForward [
	| fileRef branchMaster branchRemove |
	
	fileRef := self repository location / 'test-to-remove.txt'.
	fileRef writeStreamDo: [ :stream | stream << 'to-remove' ].
	
	self repository index addPath: (fileRef relativeTo: self repository location).
	self repository commitWithMessage: 'first commit'.
	branchMaster := self repository branch.

	self repository checkoutBranch: 'remove-branch'.
	fileRef ensureDelete.
	self repository index addPath: (fileRef relativeTo: self repository location).
	self repository commitWithMessage: 'commit removed file'.
	branchRemove := self repository branch.	
	
	branchMaster checkout.
	branchRemove merge.
	
	self deny: fileRef exists
]

{ #category : 'tests' }
IceGitMergeTest >> testMergeWithFileRemovedWithMerge [
	| fileRef otherFileRef branchMaster branchRemove |
	
	fileRef := self repository location / 'test-to-remove.txt'.
	fileRef writeStreamDo: [ :stream | stream << 'to-remove' ].
	self repository index addPath: (fileRef relativeTo: self repository location).
	self repository commitWithMessage: 'first commit'.
	branchMaster := self repository branch.

	self repository checkoutBranch: 'remove-branch'.
	fileRef ensureDelete.
	self repository index addPath: (fileRef relativeTo: self repository location).
	self repository commitWithMessage: 'commit removed file'.
	branchRemove := self repository branch.	
	
	branchMaster checkout.
	otherFileRef := self repository location / 'other-test-to-remove.txt'.
	otherFileRef writeStreamDo: [ :stream | stream << 'to-remove' ].
	self repository index addPath: (otherFileRef relativeTo: self repository location).
	self repository commitWithMessage: 'commit 2nd file'.	
	
	branchRemove merge.
	
	self assert: otherFileRef exists.
	self deny: fileRef exists.
]

{ #category : 'tests' }
IceGitMergeTest >> testMergeWithMissingProjectFile [
	| incomingBranch fileRef |

	self repository checkoutBranch: 'master'.	
	self repository commitWithMessage: 'Initial Commit'.

	self repository checkoutBranch: 'localBranch'.
	self repository workingCopy project: self repository newUnbornProject.
	fileRef := self repository location / 'test1.txt'.
	fileRef writeStreamDo: [ :stream | stream << 'test1' ].
	self repository index addPath: (fileRef relativeTo: self repository location).
	self repository commitWithMessage: 'committing something'.
	incomingBranch := self repository branch.
	
	self repository checkoutBranch: 'master'.	
	self repository workingCopy project: (IceBasicProject onRepository: self repository withSourceDirectory: '').
	fileRef := self repository location / 'test2.txt'.
	fileRef writeStreamDo: [ :stream | stream << 'test2' ].
	self repository index addPath: (fileRef relativeTo: self repository location).
	self repository commitWithMessage: 'second commit in master'.

	incomingBranch merge.
		
	self assert: self repository workingCopy referenceCommit comment equals: 'Merge ' , incomingBranch commit id
]

{ #category : 'tests' }
IceGitMergeTest >> testResolveConflictInFileCreatesCorrectMergeCommit [
	| fileRef branchMaster conflictingCommit baseCommit |
	
	fileRef := self repository location / 'conflicting.txt'.
	fileRef writeStreamDo: [ :stream | stream << 'some contents' ].
	self repository index addPath: (fileRef relativeTo: self repository location).
	self repository commitWithMessage: 'first commit'.
	branchMaster := self repository branch.

	self repository checkoutBranch: 'second-branch'.
	fileRef writeStreamDo: [ :stream | stream << 'some contents from second branch' ].
	self repository index addPath: (fileRef relativeTo: self repository location).
	self repository commitWithMessage: 'change from second branch'.
	conflictingCommit := self repository branch commit.
	
	branchMaster checkout.
	fileRef writeStreamDo: [ :stream | stream << 'some contents from first branch' ].
	self repository index addPath: (fileRef relativeTo: self repository location).
	self repository commitWithMessage: 'commit from first branch'.
	baseCommit := branchMaster commit.
	
	[ conflictingCommit merge ]
		on: IceMergeResolutionRequest
		do: [ :request | 
			request merge conflictsDo: [ :c | c selectLeft ].
			request resume: true ].
		
	self assert: (self repository headCommit ancestors includes: baseCommit).
	self assert: (self repository headCommit ancestors includes: conflictingCommit).
	
	self assert: (self repository headCommit fileSystem / 'conflicting.txt') contents equals: 'some contents from second branch'
]
