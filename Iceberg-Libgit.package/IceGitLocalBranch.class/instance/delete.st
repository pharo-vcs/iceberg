API-branches
delete

	repository withRepoDo: [ :repo | | found |
		found := repo lookupLocalBranch: self name ifAbsent: [ nil ].
		repo deleteBranch: found.
	].