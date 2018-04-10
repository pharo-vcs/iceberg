running
assertIndexIsClean

	| diff |
	diff := (LGitDiff of: repository repositoryHandle)
		diffTree: repository head commit libgitCommit tree toIndex: repository repositoryHandle index;
		yourself.

	self assert: diff numberOfDeltas equals: 0