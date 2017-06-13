accessing
changedPackagesToWorkingCopy: aWorkingCopy
	| lastCommit commitPackageNames loadedPackageNames added removed |
	
	lastCommit := self repository branch lastCommit.
	commitPackageNames := lastCommit packageNames.
	loadedPackageNames := self repository loadedPackages collect: #name.
	added := (loadedPackageNames \ commitPackageNames) 
		collect: [ :each | self repository packageNamed: each ]. 
	self flag: #todo.
	"This may be a problem. It *may* means package was removed. 
	 But it can also means package was simply not loaded."
	"removed := commitPackageNames \ loadedPackageNames."
	^ added, 
		(self loadedVersions keys select: [ :each | each isModified ])