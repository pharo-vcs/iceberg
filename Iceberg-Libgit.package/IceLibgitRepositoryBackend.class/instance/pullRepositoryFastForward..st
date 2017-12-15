private pulling
pullRepositoryFastForward: repo
	repo checkout_treeish: repo head upstream object.
	repo fastForward 