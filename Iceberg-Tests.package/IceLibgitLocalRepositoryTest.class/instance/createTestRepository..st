auxiliar
createTestRepository: aRemoteRepository
	^ (super createTestRepository: aRemoteRepository) 
		storageClass: IceLibgitLocalRepository;
		yourself