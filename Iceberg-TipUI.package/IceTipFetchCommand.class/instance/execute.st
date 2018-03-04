execution
execute
	| repository |
	repository := self repositoryModel entity.
	UIManager default 	
		informUser: ('Fetching incoming commits of {1}' format: { repository name }) 
		during: [ 
			self withErrorHandlingDo: [ repository fetch.
			  Iceberg announcer announce: (IceRepositoryModified for: repository) ] ]