accessing
branchName
	^ branchName ifNil: [ branchName := self obtainBranchName ]