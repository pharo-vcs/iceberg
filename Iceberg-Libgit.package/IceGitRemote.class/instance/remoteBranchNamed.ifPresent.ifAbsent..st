branches
remoteBranchNamed: aString ifPresent: presentBlock ifAbsent: absentBlock
	| found |
	found := self repositoryHandle lookupRemoteBranch: self name , '/' , aString ifAbsent: [ nil ].
	^ found ifNil: absentBlock ifNotNil: [ ^ presentBlock value: (localRepository basicNewRemoteBranchNamed: found name) ]