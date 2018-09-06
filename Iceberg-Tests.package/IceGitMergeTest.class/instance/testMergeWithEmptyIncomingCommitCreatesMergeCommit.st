tests
testMergeWithEmptyIncomingCommitCreatesMergeCommit
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