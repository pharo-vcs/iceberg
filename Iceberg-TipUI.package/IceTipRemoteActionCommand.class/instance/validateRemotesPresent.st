validating
validateRemotesPresent
	self repositoryModel hasRemotes
		ifFalse: [ IceNoRemote signal  ]