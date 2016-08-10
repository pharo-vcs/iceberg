privte
getOrCreatePackageNamed: packageName

	^ (savedPackages ifNil: [ self loadSavedPackages ])
		at: packageName
		ifAbsentPut: [ (IceSavedPackage new 
			package: (IcePackageReference named: packageName); 
			repository: self; 
			yourself) ]