packages
addPackageNamed: aString 
	
	self addPackage: (IceSavedPackage named: aString asSymbol repository: repository)