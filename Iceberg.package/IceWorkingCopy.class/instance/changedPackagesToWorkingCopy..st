changes
changedPackagesToWorkingCopy: aWorkingCopy
	| commitPackageNames loadedPackageNames added removed |
	commitPackageNames := self repository branch commit packageNames.
	loadedPackageNames := self packageNames.
	added := (loadedPackageNames \ commitPackageNames) 
		collect: [ :each | self repository packageNamed: each ]. 
	"this will give me the removals, but I'm still don't know what to do with them
	 (because if I just add it it will show them as added not as removed)"
	removed := (commitPackageNames \ loadedPackageNames)
		reject: [ :each | self packageNames includes: each ]
		thenCollect: [ :each | IceSavedPackage named: each repository: self repository ].
	
	^ added, (self modifiedPackages
		collect: [ :mcPackage | IceSavedPackage named: mcPackage name repository: repository ] as: Array),
			removed