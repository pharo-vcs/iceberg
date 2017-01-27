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
		transformed: [ :repository :selectedCommit | selectedCommit ifNotNil: [
				selectedCommit diffWith: (repository mergeBaseWith: selectedCommit) ]];
		andShow: [ :a | a custom: (IceGlamourChangesTree withTitle: 'Incoming changes') ].

	self addDiffTo: browser.
	self addCommitInfoTo: browser 
