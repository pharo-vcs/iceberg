building
compose
	self tabulator with: [ :browser | 
		browser
			row: [ :top | top
				column: #commits; 
				column: #changes ];
			row: #diff.

		browser transmit
			to: #commits;
			transformed: #incommingCommits;
			andShow: [ :a | a title: 'New commits to be imported'.
				a fastTable
					column: 'User' evaluated: #username width: 120;
					column: 'Date & time' evaluated: [:commit | commit datetime asLocal asStringYMDHM ] width: 120;
					column: 'Comment' evaluated: #comment ].

		browser transmit 
			to: #changes; 
			transformed: #workingCopyDiff;
			andShow: [ :a | a custom: IceGlamourChangesTree new ].

		self addDiffTo: browser withTitle: 'Left: working copy / Right: incomming updates'.
	]
