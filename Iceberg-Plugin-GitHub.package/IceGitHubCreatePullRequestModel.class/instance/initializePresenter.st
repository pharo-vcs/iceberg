initialization
initializePresenter

	super initializePresenter.
	self titlePanel text: self branch shortname.
	self headForkList
		items: self availableRemotes;
		displayBlock: [ :each | each owner , '/' , each projectName ];
		selectedItem: self headRemote.
	self headBranchList
		items: self availableBranchNames;
		displayBlock: [ :each | each ];
		selectedItem: self defaultHeadBranchName.
	self baseForkList
		items: self availableRemotes;
		displayBlock: [ :each | each owner , '/' , each projectName ];
		selectedItem: self baseRemote.
	self baseBranchList
		items: self availableBranchNames;
		displayBlock: [ :each | each ];
		selectedItem: self defaultBaseBranchName.
	self bodyPanel text: self obtainLastCommitMessage