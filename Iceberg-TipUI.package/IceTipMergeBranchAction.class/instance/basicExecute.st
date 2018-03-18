executing
basicExecute
	UIManager default
		informUser: ('Merging branch {1} from {2}' 
			format: { self branch name. self repository name }) 
		during: [ self branch merge ].
	Iceberg announcer announce: (IceRepositoryModified for: self repository).