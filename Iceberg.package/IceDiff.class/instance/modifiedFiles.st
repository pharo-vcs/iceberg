accessing
modifiedFiles
	
	^ self root accept: (IceWorkingCopyFileCollectorVisitor new
		repository: self repository;
		diff: self)