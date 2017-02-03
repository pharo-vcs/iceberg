building
composeCommitsListIn: composite
	composite fastTable
		title: 'New local commits to be published';
		display: [ :each | each outgoingCommitsTo: each pushRemote ];
		column: 'User' evaluated: #username width: 120;
		column: 'Date & time' evaluated: [:commit | commit datetime asLocal asStringYMDHM ] width: 120;
		column: 'Comment' evaluated: #comment;
		updateOn: IceCommited, IcePushed from: #announcer;
		addAction: self pushAction;
		addSelectionAction: self mergeIntoAction