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
			andShow: [ :a | self composeCommitsListIn: a ].

		browser transmit
			fromOutsideEntityPort;
			from: #commits; 
			to: #changes; 
			transformed: [ :repository :selectedCommit | selectedCommit ifNotNil: [
				IceDiff
					from: selectedCommit
					to: repository upstream lastCommit ]];
			andShow: [ :a | a custom: (IceGlamourChangesTree withTitle: 'Incomming changes') ].

		self addDiffTo: browser withTitle: 'Left: working copy / Right: incomming updates'.
	]
