operations
storeInRepository: aRepository

	self root mergedTree accept: (IceWorkingCopyWriterVisitor new
		repository: aRepository;
		diff: self)