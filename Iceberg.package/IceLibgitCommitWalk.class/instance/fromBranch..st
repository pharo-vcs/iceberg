walk definition
fromBranch: branch
	self revwalk pushReference: (lgitRepository lookupBranch: branch name)
