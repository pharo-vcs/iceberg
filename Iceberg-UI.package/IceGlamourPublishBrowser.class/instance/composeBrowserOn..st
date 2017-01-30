building
composeBrowserOn: browser
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
		transformed: [ :repository :selectedCommit | 
			selectedCommit ifNotNil: [ selectedCommit diffWith: repository currentBranch upstream ]];
		andShow: [ :a :diff | 
			(IceDiffChangeTreeBuilder diff: diff buildOn: a)
				title: 'Incoming changes' ].

	self addDiffTo: browser.
	self addCommitInfoTo: browser 
	