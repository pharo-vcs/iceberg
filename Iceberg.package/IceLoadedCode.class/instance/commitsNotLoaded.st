querying
commitsNotLoaded
	| loadedCommits |
	loadedCommits := self loadedVersions collect: #commit as: Set.

	^ self repository newCommitWalk
		fromHead;
		uptoCommits: loadedCommits;
		commits
