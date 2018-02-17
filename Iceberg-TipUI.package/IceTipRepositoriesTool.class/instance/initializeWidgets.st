initialization
initializeWidgets
	super initializeWidgets.
	
	repositoryList := self newTable asSpecAdapter.
	repositoryList widget announcer weak
		when: FTStrongSelectionChanged 
		send: #repositorySelected: 
		to: self.

	self initializeRepositoryList.