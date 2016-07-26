private
commitsInBranch: branchName do: aBlock
	self withRepoDo: [ :repo |
		(LGitRevwalk of: repo)
			pushReference: (repo lookupBranch: branchName);
			do: aBlock.
	]
