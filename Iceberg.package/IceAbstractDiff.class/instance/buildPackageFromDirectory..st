building
buildPackageFromDirectory: aString 
	
	^ changesDictionary
		at: aString
		ifAbsentPut: [ 
			IcePackageDiff
				package: (IcePackage 
					named: (self repository writerClass packageNameFromDirectoryName: aString)
					repository: self repository)
				parent: self ]