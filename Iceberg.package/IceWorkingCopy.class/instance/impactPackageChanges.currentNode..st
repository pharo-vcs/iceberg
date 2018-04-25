private-impacting-changes
impactPackageChanges: anIcePackageDefinition currentNode: currentNode
	| loader |
	
	(self repository packageNamed: anIcePackageDefinition name) isLoaded
		ifFalse: [ ^ self ].
	
	loader := MCPackageLoader new.
	currentNode accept: (IceMCSnapshotPatchVisitor new
		patcher: loader;
		yourself).
	loader load