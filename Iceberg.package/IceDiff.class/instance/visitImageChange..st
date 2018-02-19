visiting
visitImageChange: anIceImageChange
	
	| name parent |
	name := self directoryNameFor: anIceImageChange package.
	parent := self sourceDirectory.
	parent
		childAt: name
		ifAbsentPut: [ self buildPackageNodeFromPackage: anIceImageChange package parent: parent ]