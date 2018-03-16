executing
basicExecute
	UIManager default
		informUser: ('Checking out new branch {1}' format: { self branchName }) 
		during: [ self repository createNewBranch: self branchName ].
	Iceberg announcer announce: (IceRepositoryModified for: self repository).	