instance-creation
onRepository: anIceMemoryRepository commitish: aCommitish

	^ self new
		repository: anIceMemoryRepository;
		commitish: aCommitish;
		yourself