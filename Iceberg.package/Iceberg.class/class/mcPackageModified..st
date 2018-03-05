class initialization
mcPackageModified: ann
	| packageName |
	
	packageName := ann package name.
	IceRepository registry 
		select: [ :each | each includesPackageNamed: packageName ]
		thenDo: [ :each | self announcer announce: (IceRepositoryModified for: each) ]