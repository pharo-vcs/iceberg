tests-branch
testSwitchToExistingBranchNameChangesRepositoryHead

	| branchName newBranch masterBranch |
	self repository head isUnbornBranch ifTrue: [ ^ self skip ].
	
	branchName := 'new'.
	newBranch := self repository createBranch: branchName.
	self assert: newBranch equals: self repository head.
	
	masterBranch := self repository switchToBranchNamed: 'master'.
	self assert: masterBranch equals: self repository head.
	
	newBranch switch.
	self assert: newBranch equals: self repository head.