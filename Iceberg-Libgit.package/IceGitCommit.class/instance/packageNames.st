accessing
packageNames
	
	^ self repository commitsInPackageCache
		at: self
		ifAbsentPut: [ self fetchPackageNames ]