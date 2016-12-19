building
composeBrowserOn: browser
	browser 
		row: [:row | 
			row column: #branches span: 2; 
			column: #commits span: 3; 
			column: #changes span: 3]; 
		row: #diff.
	
	browser transmit to: #branches; andShow: [ :a | self composeBranchesIn: a ].
	browser transmit from: #branches; to: #commits; andShow: [ :a | self composeCommitsIn: a ].
	
	browser transmit 
		fromOutsideEntityPort;
		from: #commits;
		to: #changes; 
		transformed: [ :repository :selectedCommit | 
			selectedCommit ifNotNil: [ IceDiff forRepository: repository commit: selectedCommit ]];
		andShow: [ :a | a custom: 
			(IceGlamourChangesTree withTitle: 'Modifications since selected commit') ].		

	self addDiffTo: browser.
	self addCommitInfoTo: browser