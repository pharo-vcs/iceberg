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
	
		browser transmit to: #commit; andShow: [ :a :diff | a morph
			morph: [
				IceCommitModel new 
					model: diff;
					buildWithSpec ];
			title: 'Commit changes'
		].

		self addDiffTo: browser withTitle: 'Left: working copy / Right: local repository'.
	]