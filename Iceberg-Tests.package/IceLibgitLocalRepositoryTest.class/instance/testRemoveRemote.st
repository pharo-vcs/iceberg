tests
testRemoveRemote
	| backend |
	repository := IceRepositoryCreator new 
		url: self scpOriginUrl;
		createRepository.
	backend := repository backend.
	
	self assert: backend remotes size equals: 1.
	backend removeRemote: repository origin.
	self assert: backend remotes size equals: 0.