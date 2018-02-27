execution
execute
	| repository |
	repository := self repositoryModel entity.
	UIManager default 	
		informUser: ('Fetching incoming commits of {1}' format: { repository name }) 
		during: [ 
			[ repository fetch.
			  Iceberg announcer announce: (IceRepositoryModified for: repository) ]
			on: IceAuthenticationError 
			do: [ :e | e acceptError: (IceInteractiveErrorVisitor repository: repository) ] ]