actions
reloadAllLoadedPackages
	self repository packages 
		select: #isLoaded 
		thenDo: [ :each | each reload ].