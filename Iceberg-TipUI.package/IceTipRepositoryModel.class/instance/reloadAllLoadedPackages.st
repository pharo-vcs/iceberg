actions
reloadAllLoadedPackages
	self entity packages
		select: #isLoaded
		thenDo: #reload