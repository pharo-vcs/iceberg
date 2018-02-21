accessing
modifiedFiles
	
	| visitor |
	visitor := IceWorkingCopyFileCollectorVisitor new
		repository: self repository;
		diff: self.
	self root mergedTree accept: visitor.
	^ visitor modifiedFiles