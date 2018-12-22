initialization
initializePresenter
	super initializePresenter.
	self pullRequests widget onAnnouncement: FTSelectionChanged send: #uptadeSelectedPullRequest: to: self.
	self pullRequests widget onAnnouncement: FTStrongSelectionChanged send: #strongSelection: to: self.