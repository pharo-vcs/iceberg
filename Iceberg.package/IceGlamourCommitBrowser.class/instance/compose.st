building
compose
	self tabulator with: [ :browser | 
		browser
			row: [ :top | top
				column: #changes; 
				column: #commit ];
			row: #diff.

		browser transmit 
			to: #changes; 
			andShow: [ :a | a custom: (IceGlamourChangesTree withTitle: 'Local changes') ].
	
		browser transmit to: #commit; andShow: [ :a | a text
			display: '';
			title: 'Commit message';
			addAction: self commitAction
		].

		self addDiffTo: browser withTitle: 'Left: working copy / Right: local repository'.
	]
