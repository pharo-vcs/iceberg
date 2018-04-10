storing
storeInRepository: aRepository

	mergeTree accept: (IceWorkingCopyWriterVisitor new
		repository: aRepository;
		diff: self)