building
composeBrowserOn: browser
	browser 
		row: #repositories; 
		row: #info.
	
	browser transmit 
		to: #repositories; 
		andShow: [ :presentation :repositories | 
			self composeRepositories: repositories in: presentation ].
	browser transmit 
		from: #repositories; 
		to: #info; 
		andShow: [ :a | self composeRepositoryInfoIn: a ]