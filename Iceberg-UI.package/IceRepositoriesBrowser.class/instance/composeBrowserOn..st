building
composeBrowserOn: browser
	browser 
		row: #repositories; 
		row: [ :column | 
			column 
				column: #info; 
				column: #packages ].
	
	browser transmit 
		to: #repositories; 
		andShow: [ :presentation :repositories | 
			self composeRepositories: repositories in: presentation ].
	browser transmit 
		from: #repositories; 
		to: #packages; 
		andShow: [ :a | self composePackagesListIn: a ].
	browser transmit 
		from: #repositories; 
		to: #info; 
		andShow: [ :a | self composeRepositoryInfoIn: a ]