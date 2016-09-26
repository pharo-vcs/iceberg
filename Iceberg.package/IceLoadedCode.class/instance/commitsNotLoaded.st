querying
commitsNotLoaded
	^ self repository newCommitWalk
		fromHead;
		uptoCommit: self referenceCommit;
		commits
