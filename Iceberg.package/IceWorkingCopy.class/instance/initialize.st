initialization
initialize
	super initialize.
	self referenceCommit: (IceNoCommit new
		repository: repository;
		yourself)