querying
allSavedPackages
	^ (savedPackages ifNil: [ self loadSavedPackages ]) values
