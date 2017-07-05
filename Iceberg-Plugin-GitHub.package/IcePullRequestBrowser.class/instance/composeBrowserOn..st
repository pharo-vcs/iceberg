building
composeBrowserOn: browser
	browser 
		row: [:row | 
			row 
				column: #commits; 
				column: #changes ]; 
		row: #diff;
		row: #actions size: 35.
	
	browser transmit to: #commits; andShow: [ :a | self composeCommitsIn: a ].

	self addChangesTreesTo: browser.
	self addDiffTo: browser.
	self addCommitInfoTo: browser.
	
	browser transmit to: #actions; andShow: [ :a | 
		a morph
			morph: [ 
				IcePullRequestActionsModel new 
					onMerge: [ self mergePullRequestIntoImage ];
					onAccept: [ self acceptPullRequest ];
					onReject: [ self rejectPullReject ];
					buildWithSpec ] ]