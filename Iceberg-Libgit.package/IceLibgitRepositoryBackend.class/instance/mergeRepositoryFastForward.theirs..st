private merging
mergeRepositoryFastForward: repo theirs: theirCommit
	repo checkout_treeish: theirCommit.
	repo head resolve setTargetId: theirCommit id