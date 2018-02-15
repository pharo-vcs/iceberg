building
buildPackageFromDirectory: aString 
	
	^ changesDictionary
		at: aString
		ifAbsentPut: [ 
			IcePackageChangeSet
				package: (IcePackage 
					named: (self repository writerClass packageNameFromDirectoryName: aString)
					repository: self repository)
				parent: self ]