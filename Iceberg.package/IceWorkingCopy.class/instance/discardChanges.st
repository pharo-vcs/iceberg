API-changes
discardChanges
	
	self diffToReferenceCommit accept: (IceRevertVisitor repository: repository).
	self markAllPackagesAsClean