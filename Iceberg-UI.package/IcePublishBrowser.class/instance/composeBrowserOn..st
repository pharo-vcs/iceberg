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
		andShow: [ :a :repo :commitInfo | 
			(IceDiffChangeTreeBuilder new
				entity: commitInfo; 
				diff: (commitInfo ifNotNil: [ commitInfo diffTo: repo branch upstream ]);
				buildOn: a)
				title: 'Outgoing changes' ].

	self addDiffTo: browser.
	self addCommitInfoTo: browser 
	