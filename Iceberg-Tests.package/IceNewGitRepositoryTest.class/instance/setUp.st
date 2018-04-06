running
setUp
	
	super setUp.
	location := UUID new asString asFileReference.
	remoteFileUrl := (IceLibgitRepository repositoriesLocation / 'remote') asUrl.
	repository := IceRepositoryCreator new
		location: location;
		createNewRepositoryNamed: 'test'.