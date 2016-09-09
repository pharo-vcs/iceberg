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
			andShow: [ :a | a fastTable
				title: 'New commits to be imported';
				display: #incommingCommits;
				column: 'User' evaluated: #username width: 120;
				column: 'SHA' evaluated: #shortId width: 60;
				column: 'Date & time' evaluated: [:commit | commit datetime asLocal asStringYMDHM ] width: 100;
				column: 'Comment' evaluated: #comment;
				updateOn: IcePackageLoaded from: #announcer;
				addAction: self fetchAction;
				addSelectionAction: self loadAction;
				addSelectionAction: self mergeAction
			].

		browser transmit
			fromOutsideEntityPort;
			from: #commits; 
			to: #changes; 
			transformed: [ :model :commit | commit ifNotNil: [model mergeBaseDiffToCommit: commit] ];
			andShow: [ :a | a custom: (IceGlamourChangesTree withTitle: 'Incomming changes') ].

		self addDiffTo: browser withTitle: 'Left: working copy / Right: incomming updates'.
	]
