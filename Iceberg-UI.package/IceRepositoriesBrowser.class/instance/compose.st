building
compose
	self tabulator with: [ :browser | 
		browser row: #repositories; row: [:c2 | c2 column: #info; column: #packages ].
		
		browser transmit to: #repositories; andShow: [ :presentation :repositories | self composeRepositories: repositories in: presentation ].
		browser transmit from: #repositories; to: #packages; andShow: [ :a | self composePackagesListIn: a ].
		browser transmit from: #repositories; to: #info; andShow: [ :a | self composeRepositoryInfoIn: a ]
	]