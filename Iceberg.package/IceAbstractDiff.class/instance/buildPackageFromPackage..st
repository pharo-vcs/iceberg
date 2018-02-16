building
buildPackageFromPackage: anIcePackage 

	^ changesDictionary
		at: (self repository writerClass directoryNameFor: anIcePackage)
		ifAbsentPut: [ 
			IcePackageDiff
				package: anIcePackage
				parent: self ]