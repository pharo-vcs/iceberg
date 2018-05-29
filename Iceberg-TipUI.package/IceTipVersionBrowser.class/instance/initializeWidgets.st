initialization
initializeWidgets
	super initializeWidgets.	
	commitList := self newIceTable.
	commitTabPanel := self newTabManager.
	
	self initializeCommitList.
	self initializeCommitPanel.
	
	commitList widget 
		onAnnouncement: FTSelectionChanged 
		send: #selectionChanged:
		to: self.
	
	self focusOrder 
		add: commitList;
		add: commitTabPanel.
		
	self refresh