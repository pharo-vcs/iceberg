querying
lookupBranchNamed: branchName inRemote: remoteName
	| fullRemoteName |
	
	fullRemoteName := remoteName, '/', branchName.
	((self command: 'branch -r') lines anySatisfy: [ :each | each trimBoth = fullRemoteName ]) 
		ifFalse: [ self error: 'remote ', fullRemoteName, ' not found.' ].
		
	^ IceRemoteBranch 
		remoteName: remoteName
		branchName: branchName
		inRepository: self frontend