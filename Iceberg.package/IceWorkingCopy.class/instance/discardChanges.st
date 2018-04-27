API-changes
discardChanges
	
	| diff |
	diff := IceDiff
		from: self
		to: self referenceCommit.
	diff accept: (IceRevertVisitor repository: repository).
	self markAllPackagesAsClean