API-branches
delete

	repository withRepoDo: [ :repo | | found |
		found := repo lookupRemoteBranch: self name ifAbsent: [ nil ].
		repo deleteBranch: found.
	].