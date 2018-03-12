operations
modifiedFiles
	
	| visitor |
	visitor := IceWorkingCopyFileCollectorVisitor new
		repository: self repository;
		diff: self.
	tree accept: visitor.
	^ visitor modifiedFiles