querying
commitsNotLoaded
	| loadedCommits |
	loadedCommits := self loadedVersions collect: #updationCommit as: Set.

	^ self repository newCommitWalk
		fromHead;
		uptoCommits: loadedCommits;
		commits
