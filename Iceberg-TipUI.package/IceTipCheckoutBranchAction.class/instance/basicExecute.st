executing
basicExecute
	UIManager default
		informUser: ('Checking out branch {1} from {2}' 
			format: { self branch name. self repository name }) 
		during: [ self branch checkout ].
	Iceberg announcer announce: (IceRepositoryModified for: self repository).