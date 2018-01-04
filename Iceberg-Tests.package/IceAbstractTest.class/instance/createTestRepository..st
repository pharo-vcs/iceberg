auxiliar
createTestRepository: aRemoteRepository
	^ IceRepositoryCreator new
	 	url: aRemoteRepository;
		location: UUID new asString asFileReference;
		createRepository.