accessing
newRepository
	UIManager default 
		informUser: ('Adding repository {1}' format: { self location fullName })
		during: [ 
			^ IceRepositoryCreator new
				repository: repository;
				location: self location;
				createRepository ]