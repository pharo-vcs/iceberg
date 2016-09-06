querying
commitsOnlyIn: branchName
	| otherBranches commitIds |
	otherBranches := self allBranchNames 
		reject: [:name | (name beginsWith: 'remotes') or: [ name = branchName ] ]
		thenCollect: [ :name | name copyUpTo: Character space ].
		
	^ (self command: { 'log'. branchName. '--not'. otherBranches . '--format=%H' }) trim lines
	