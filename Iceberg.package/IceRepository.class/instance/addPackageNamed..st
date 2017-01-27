actions
addPackageNamed: packageName
	^ self savedPackagesDictionary
		at: packageName
		ifAbsentPut: [ IceSavedPackage 
			named: packageName 
			repository: self ]