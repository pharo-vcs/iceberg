initialization
initializeWidgets

	super initializeWidgets.	
	commitList := self newIceTable.
	commitPanel := self newNotebook.
	
	self initializeCommitList.
	self initializeCommitPanel.
	
	commitList widget 
		onAnnouncement: FTSelectionChanged 
		send: #selectionChanged:
		to: self.
	
	self focusOrder 
		add: commitList;
		add: commitPanel.
		
	self refresh