visiting
visitImageChange: anIceImageChange 

	parentNode
		childAt: (diff directoryNameFor: anIceImageChange package)
		ifAbsentPut: [ self ensurePackageFromPackage: anIceImageChange package ]