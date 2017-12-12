actions
createRepository
	[
		| repository |
		
		repository := IceRepositoryCreator new 
			remote: (IceRemote url: remoteUrl text trim);
			location: self location;
			subdirectory: subdirectory text;
			createRepository.
		self configureRepository: repository.
		self window delete. 
	]
	on: IceError 
	do: [ :e | e acceptError: IceInteractiveErrorVisitor new ]