auxiliar
createTestRepository: aRemoteRepository
	^ IceRepositoryCreator new
	 	url: aRemoteRepository;
		createRepository.