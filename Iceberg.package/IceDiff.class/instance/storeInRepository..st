storing
storeInRepository: aRepository

	self root accept: (IceWorkingCopyWriterVisitor new
		repository: aRepository;
		diff: self)