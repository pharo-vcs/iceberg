API-branches
branchNamed: aString ifPresent: presentBlock ifAbsent: absentBlock

	self handleLibgitError: [ | found |
		found := self repositoryHandle lookupLocalBranch: aString ifAbsent: [ nil ].
		^ found ifNil: absentBlock ifNotNil: [ presentBlock value: (self basicNewBranchNamed: aString) ] ]