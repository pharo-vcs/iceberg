initialization
initializePresenter
	super initializePresenter.
	self commits widget onAnnouncement: FTSelectionChanged send: #uptadeSelectedCommit: to: self.
	
	mergeButton action: [ self mergePullRequestIntoImage ].
	acceptButton action: [ self acceptPullRequest ].
	rejectButton action: [ self rejectPullRequest ]