tests-branch
testSwitchToExistingBranchNameWithSlashesChangesRepositoryHead

	| branchName newBranch masterBranch |
	repository head isUnbornBranch ifTrue: [ ^ self skip ].
	
	branchName := 'feature/new'.
	newBranch := repository createBranch: branchName.
	self assert: newBranch equals: repository head.
	
	masterBranch := repository switchToBranchNamed: 'master'.
	self assert: masterBranch equals: repository head.
	
	newBranch switch.
	self assert: newBranch equals: repository head.