execution
execute
	| repository |
	repository := self repositoryModel entity.
	UIManager default 	
		informUser: ('Fetching incoming commits of {1}' format: { repository name }) 
		during: [ 
			[ repository fetch ]
			on: IceAuthenticationError 
			do: [ :e | e acceptError: (IceInteractiveErrorVisitor repository: repository) ] ]