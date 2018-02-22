visiting
visitPackage: anIcePackageDefinition 
	
	| loader |
	loader := MCPackageLoader new.
	currentNode accept: (IceMCSnapshotPatchVisitor new
		patcher: loader;
		yourself).
	loader load