building
compose
	self tabulator with: [ :browser | 
		browser column: #repositories; column: [:c2 | c2 row: #packages; row: #info ].
		
		browser transmit to: #repositories; andShow: [ :presentation :repositories | self composeRepositories: repositories in: presentation ].
		browser transmit from: #repositories; to: #packages; andShow: [ :a | self composePackagesListIn: a ].
		browser transmit from: #repositories; to: #info; andShow: [ :a | self composeRepositoryInfoIn: a ]
	]