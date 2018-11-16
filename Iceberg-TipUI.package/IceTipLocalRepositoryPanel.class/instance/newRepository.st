accessing
newRepository
	UIManager default 
		informUser: ('Importing repository from {1}' format: { self location fullName })
		during: [ 
			^ IceRepositoryCreator new
				repository: repository;
				location: self location;
				createRepository ]