*Iceberg-Libgit
modifiedFiles
	
	| visitor |
	visitor := IceWorkingCopyFileCollectorVisitor new
		repository: self repository;
		diff: self.
	mergeTree accept: visitor.
	^ visitor modifiedFiles