actions
reloadAllLoadedPackages
	self repositories savedPackages 
		select: #isLoaded 
		thenDo: [ :each | each reload ].