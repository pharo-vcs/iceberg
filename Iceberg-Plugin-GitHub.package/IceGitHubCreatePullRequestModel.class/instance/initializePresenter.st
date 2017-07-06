initialization
initializePresenter
	super initializePresenter.
	self titlePanel text: self branch basename.
	self headForkList
		items: self availableRemotes;
		displayBlock: [ :each | each owner, '/', each projectName ];
		setSelectedItem: self headRemote.
	self headBranchList 
		items: self availableBranchNames;
		displayBlock: [ :each | each ];
		setSelectedItem: self defaultHeadBranchName.
	self baseForkList
		items: self availableRemotes;
		displayBlock: [ :each | each owner, '/', each projectName ];
		setSelectedItem: self baseRemote.
	self baseBranchList 
		items: self availableBranchNames;
		displayBlock: [ :each | each ];
		setSelectedItem: self defaultBaseBranchName