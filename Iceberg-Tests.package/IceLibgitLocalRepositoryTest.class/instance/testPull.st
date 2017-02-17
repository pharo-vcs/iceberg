tests
testPull
	repository := IceRepositoryCreator new 
		url: self scpOriginUrl;
		createRepository.
	self assert: repository backend class equals: IceLibgitLocalRepository.
	repository pull
