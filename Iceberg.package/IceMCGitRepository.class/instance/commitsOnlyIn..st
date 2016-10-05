querying
commitsOnlyIn: branchName
	| otherBranches |
	otherBranches := self allBranchNames 
		reject: [:name | (name beginsWith: 'remotes') or: [ name = branchName ] ]
		thenCollect: [ :name | name copyUpTo: Character space ].
		
	^ (self command: { 'log'. branchName. '--not'. otherBranches . '--format=%H' }) 
		trim lines 
		collect: [ :id | self frontend commitAt: id ]	