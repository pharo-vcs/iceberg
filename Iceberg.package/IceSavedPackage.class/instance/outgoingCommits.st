querying
outgoingCommits
	^ self repository newCommitWalk 
		fromHead;
		uptoCommit: self repository currentBranch upstream lastCommit; 
		modifyingPackage: self;
		commits
