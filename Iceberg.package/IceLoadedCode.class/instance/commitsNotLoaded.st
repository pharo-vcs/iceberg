querying
commitsNotLoaded
	^ self repository newCommitWalk
		fromHead;
		uptoVersions: self loadedVersions;
		commits
