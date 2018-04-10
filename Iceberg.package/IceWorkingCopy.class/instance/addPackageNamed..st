API-packages
addPackageNamed: aString 
	
	self addPackage: (IcePackage named: aString asSymbol repository: repository) beDirty