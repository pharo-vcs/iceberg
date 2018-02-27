packages
basicAddPackage: aPackage
	
	super basicAddPackage: aPackage.
	ringEnvironment ensurePackageNamed: aPackage name.