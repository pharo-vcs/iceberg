building
compose
	self tabulator with: [ :browser |
		browser 
			column: [:col | col row: #branches; row: #packages ]; 
			column: #commits;
			column: #changes.
	]