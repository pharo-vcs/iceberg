executing
basicExecute
	UIManager default 
		informUser: 'Adding packages' 
		during: [ 
			self packages do: [ :each | self repository workingCopy addPackageNamed: each name ] ].
	Iceberg announcer announce: (IceRepositoryModified for: self repository)