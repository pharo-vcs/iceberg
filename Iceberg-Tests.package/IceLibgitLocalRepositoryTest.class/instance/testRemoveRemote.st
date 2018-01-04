tests
testRemoveRemote
	repository := IceRepositoryCreator new 
		url: self scpOriginUrl;
		createRepository.
	
	self assert: repository remotes size equals: 1.
	repository removeRemote: repository origin.
	self assert: repository remotes size equals: 0.