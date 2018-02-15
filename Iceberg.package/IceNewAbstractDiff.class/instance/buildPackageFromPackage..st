building
buildPackageFromPackage: anIcePackage 

	^ changesDictionary
		at: (self repository writerClass directoryNameFor: anIcePackage)
		ifAbsentPut: [ 
			IcePackageChangeSet
				package: anIcePackage
				parent: self ]