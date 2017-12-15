tests
testPush
	repository := IceRepositoryCreator new 
		url: self scpOriginUrl;
		createRepository.
	self assert: repository backend class equals: IceLibgitRepositoryBackend.

	self scenarioOutgoingCommit.
	repository push
