visiting
visitPackage: anIcePackageDefinition
	
	(self repository packageNamed: anIcePackageDefinition name) isLoaded
		ifFalse: [ ^ self ].
	
	currentNode accept: (IceMCSnapshotPatchVisitor new
		patcher: loader;
		yourself).