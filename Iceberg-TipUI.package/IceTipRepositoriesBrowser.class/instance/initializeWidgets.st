initialization
initializeWidgets
	super initializeWidgets.
	
	repositoryList := self newIceTable.
	repositoryList widget
		onAnnouncement: FTStrongSelectionChanged 
		send: #repositoryStrongSelection: 
		to: self.

	self initializeRepositoryList.
	
	self focusOrder add: repositoryList 