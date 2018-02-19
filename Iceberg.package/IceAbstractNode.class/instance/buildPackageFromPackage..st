building
buildPackageFromPackage: anIcePackage 

	^ changesDictionary
		at: (self repository writerClass directoryNameFor: anIcePackage)
		ifAbsentPut: [ 
			IcePackageNode
				package: anIcePackage
				parent: self ]