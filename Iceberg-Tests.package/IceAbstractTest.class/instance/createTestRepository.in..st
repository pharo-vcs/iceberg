auxiliar
createTestRepository: aRemoteRepository in: location
	^ IceRepositoryCreator new
	 	url: aRemoteRepository;
		location: location asFileReference;
		createRepository.