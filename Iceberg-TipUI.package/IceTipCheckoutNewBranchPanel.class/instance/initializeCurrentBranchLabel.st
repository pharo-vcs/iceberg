initialization
initializeCurrentBranchLabel
	currentBranchLabel := self newLabel
		label: 'Current branch: ' , self model branchName