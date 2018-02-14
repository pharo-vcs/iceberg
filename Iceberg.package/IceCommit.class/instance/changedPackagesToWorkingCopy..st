private-changes
changedPackagesToWorkingCopy: left 
	
	| leftPackageNames rightPackageNames added removed |
	
	"We do not need to do a double dispatch to calculate a diff.
	diffBetween: a and: b
	  a snapshot difference: b snapshot.
	
	 - Monticello already knows how to do it
	 - the algorithm is in only one place
	 - exploit polymorphism
	"
	self flag: #refactor.
	
	leftPackageNames := left packageNames.
	rightPackageNames := self packageNames.
	added := (leftPackageNames \ rightPackageNames) 
		collect: [ :each | IcePackage named: each repository: self repository ].
	"this will give me the removals, but I'm still don't know what to do with them
	 (because if I just add it it will show them as added not as removed)"
	removed := (rightPackageNames \ leftPackageNames)
		reject: [ :each | self packageNames includes: each ]
		thenCollect: [ :each | IcePackage named: each repository: self repository ].
	
	^ added, ((left modifiedPackages
		reject: [ :p | (leftPackageNames \ rightPackageNames ) includes: p name ])
		collect: [ :mcPackage | IcePackage named: mcPackage name repository: repository ] as: Array),
			removed