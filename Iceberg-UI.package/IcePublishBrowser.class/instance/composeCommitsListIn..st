building
composeCommitsListIn: composite
	composite fastTable
		title: 'New local commits to be published';
		display: #outgoingCommits;
		column: 'Author' evaluated: #author width: 120;
		column: 'Date & time' evaluated: [:commit | commit datetime asLocal asStringYMDHM ] width: 120;
		column: 'Comment' evaluated: #comment;
		updateOn: IceCommited, IcePushed from: #announcer;
		addAction: self pushAction;
		addSelectionAction: self mergeIntoAction;
		when: [ :repository | repository branch tracksRemoteBranch ].

	composite label
		title: 'New local commits to be published';
		display: 'There is no remote branch corresponding to this branch. All commits in the branch will be pushed.';
		addAction: self pushAction;
		when: [ :repository | repository branch tracksRemoteBranch not ]