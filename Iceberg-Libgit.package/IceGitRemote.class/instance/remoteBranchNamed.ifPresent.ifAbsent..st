branches
remoteBranchNamed: aString ifPresent: presentBlock ifAbsent: absentBlock 
	
	| found |
	localRepository withRepoDo: [ :repo |
		found := repo lookupRemoteBranch: self name, '/', aString ifAbsent: [ nil ] ].
	^ found
		ifNil: absentBlock 
		ifNotNil: [ ^ presentBlock value: 
			(localRepository basicNewRemoteBranchNamed: found name) ]