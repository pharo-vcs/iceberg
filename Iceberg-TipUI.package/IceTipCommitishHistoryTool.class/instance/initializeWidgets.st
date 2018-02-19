initialization
initializeWidgets
	super initializeWidgets.	
	commitList := self newTable.
	commitPanel := self newTabManager.
	
	self initializeCommitList.
	self initializeCommitPanel.
	
	commitList widget 
		onAnnouncement: FTSelectionChanged 
		send: #selectionChanged:
		to: self.
	
	self focusOrder 
		add: commitList;
		add: commitList