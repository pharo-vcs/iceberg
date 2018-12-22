initialization
initializeWidgets
	super initializeWidgets.
	pullRequests := self newIceTable.
	details := self instantiate: IceGitHubPullRequestDetailModel.
	
	self initializePullRequestsTable.
	
	self focusOrder
		add: pullRequests;
		add: details