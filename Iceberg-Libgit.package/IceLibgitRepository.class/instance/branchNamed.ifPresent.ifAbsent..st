branches
branchNamed: aString ifPresent: presentBlock ifAbsent: absentBlock
	| found |
	found := self repositoryHandle lookupLocalBranch: aString ifAbsent: [ nil ].
	^ found ifNil: absentBlock ifNotNil: [ presentBlock value: (self basicNewBranchNamed: aString) ]