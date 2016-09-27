querying
outgoingCommits
	^ self repository newCommitWalk 
		fromHead;
		uptoCommit: self repository upstream lastCommit; 
		modifyingPackage: self;
		commits
