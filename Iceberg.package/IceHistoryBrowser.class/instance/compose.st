building
compose
	self tabulator with: [ :browser |
		browser 
			column: [:col | col row: #branches; row: #packages ]; 
			column: #commits;
			column: #versions.
		
		browser transmit to: #branches; andShow: [ :a | self composeBranchesIn: a ].
		browser transmit from: #branches; to: #commits; andShow: [ :a | self composeCommitsIn: a ].
		browser transmit from: #commits; to: #versions; andShow: [ :a | self composeVersionsIn: a ]
	]