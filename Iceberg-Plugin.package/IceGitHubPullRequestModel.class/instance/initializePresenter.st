initialization
initializePresenter
	super initializePresenter.
	self titlePanel text: self currentBranch basename.
	self headForkList
		items: self availableRemotes;
		displayBlock: [ :each | each owner, '/', each projectName ];
		setSelectedItem: self repository pushRemote.
	self headBranchList 
		items: self availableBranchNames;
		displayBlock: [ :each | each ];
		setSelectedItem: self currentBranch basename.
	self baseForkList
		items: self availableRemotes;
		displayBlock: [ :each | each owner, '/', each projectName ];
		setSelectedItem: self baseRemote.
	self baseBranchList 
		items: self availableBranchNames;
		displayBlock: [ :each | each ];
		setSelectedItem: self defaultBaseBranchName