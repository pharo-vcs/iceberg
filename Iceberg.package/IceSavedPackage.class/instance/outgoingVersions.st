querying
outgoingVersions
	^ self repository newCommitWalk 
		fromHead;
		uptoCommits: { self loadedVersion commit }; 
		modifyingPackage: self;
		commits
