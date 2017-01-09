querying
allBranches
	^ (self command: 'branch -a') lines 
		select: [:line | (line includesSubstring: '->') not ] 
		thenCollect: [ :line | 
			IceBranch 
				named: (line allButFirst: 2) 
				inRepository: self frontend ]
