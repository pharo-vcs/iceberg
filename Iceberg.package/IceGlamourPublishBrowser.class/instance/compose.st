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
				title: 'New local commits to be published';
				display: #outgoingCommits;
				column: 'User' evaluated: #username width: 120;
				column: 'Date & time' evaluated: [:commit | commit datetime asLocal asStringYMDHM ] width: 120;
				column: 'Comment' evaluated: #comment;
				updateOn: IcePushed from: #announcer;
				updateOn: IceCommited from: #announcer;
				addAction: self pushAction].

		browser transmit
			fromOutsideEntityPort;
			from: #commits; 
			to: #changes; 
			transformed: [ :model :commit | commit ifNotNil: [model mergeBaseDiffToCommit: commit] ];
			andShow: [ :a | a custom: (IceGlamourChangesTree withTitle: 'Incomming changes') ].

		self addDiffTo: browser withTitle: 'Left: working copy / Right: incomming updates'.
	]
