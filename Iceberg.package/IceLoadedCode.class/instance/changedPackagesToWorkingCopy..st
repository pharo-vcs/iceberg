accessing
changedPackagesToWorkingCopy: aWorkingCopy
	| lastCommit commitPackageNames loadedPackageNames added removed |
	
	lastCommit := self repository branch lastCommit.
	commitPackageNames := lastCommit packageNames.
	loadedPackageNames := self repository loadedPackages collect: #name.
	added := (loadedPackageNames \ commitPackageNames) 
		collect: [ :each | self repository packageNamed: each ]. 
	"this will give me the removals, but I'm still don't know what to do with them
	 (because if I just add it it will show them as added not as removed)"
	"removed := (commitPackageNames \ loadedPackageNames)
		reject: [ :each | self repository includesPackageNamed: each ]
		thenCollect: [ :each | IceSavedPackage named: each repository: self repository ]."
	^ added,
		(self loadedVersions keys select: [ :each | each isModified ])