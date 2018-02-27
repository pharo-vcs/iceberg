packages
addPackage: aPackage
	
	super addPackage: aPackage.
	ringEnvironment ensurePackageNamed: aPackage name.
	aPackage markAsDirty.