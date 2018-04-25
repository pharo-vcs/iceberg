running
assertIndexIsClean

	| diff |
	diff := (LGitDiff of: self repository repositoryHandle)
		diffTree: self repository head commit libgitCommit tree toIndex: self repository repositoryHandle index;
		yourself.

	self assert: diff numberOfDeltas equals: 0