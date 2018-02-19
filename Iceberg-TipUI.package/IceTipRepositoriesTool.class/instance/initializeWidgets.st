initialization
initializeWidgets
	super initializeWidgets.
	
	repositoryList := self newTable.
	repositoryList widget
		onAnnouncement: FTStrongSelectionChanged 
		send: #repositorySelected: 
		to: self.

	self initializeRepositoryList.