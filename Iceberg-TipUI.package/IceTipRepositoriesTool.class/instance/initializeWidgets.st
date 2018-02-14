initialization
initializeWidgets
	super initializeWidgets.
	
	repositoryList := self newTable asSpecAdapter.
	repositoryList widget
		onAnnouncement: FTStrongSelectionChanged 
		send: #repositorySelected: 
		to: self.

	self initializeRepositoryList.