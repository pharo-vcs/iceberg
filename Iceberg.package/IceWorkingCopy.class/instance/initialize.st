initialization
initialize
	super initialize.
	packages := Dictionary new.
	self referenceCommit: (IceNoCommit new
		repository: repository;
		yourself)