querying
outgoingCommits
	^ self repository currentBranch outgoingCommitsWalk
		modifyingPackage: self;
		commits