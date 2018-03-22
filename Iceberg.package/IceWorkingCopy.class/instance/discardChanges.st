API-changes
discardChanges
	
	| diff |
	diff := IceDiff
		from: self
		to: repository head.
	diff accept: (IceRevertVisitor repository: repository).