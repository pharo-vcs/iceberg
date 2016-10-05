maintenance
rebuildRepositories
	IceRepository registry do: [ :repo | 
		repo initialize.
		repo branchName: repo branch name.
		repo commitDictionary.
		repo loadedPackages do: [ :pkg |
			repo versionLoaded: pkg computeLoadedVersion.
		]]
