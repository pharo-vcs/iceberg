operations
storeInRepository: aRepository

	tree accept: (IceWorkingCopyWriterVisitor new
		repository: aRepository;
		diff: self)