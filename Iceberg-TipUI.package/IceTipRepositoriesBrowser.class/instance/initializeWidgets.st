initialization
initializeWidgets
	super initializeWidgets.
	
	repositoryList := self newTable.
	repositoryList widget
		onAnnouncement: FTStrongSelectionChanged 
		send: #repositoryStrongSelection: 
		to: self.

	self initializeRepositoryList.
	
	self focusOrder add: repositoryList 