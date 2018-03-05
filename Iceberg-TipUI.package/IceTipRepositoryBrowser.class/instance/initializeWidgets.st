initialization
initializeWidgets
	super initializeWidgets.	
	
	sidebarTree := self newTable.
	historyPanel := self instantiate: IceTipCommitishHistoryBrowser on: self model branchModel.
	
	self initializeSidebarTree.
	sidebarTree widget
		onAnnouncement: FTSelectionChanged 
		send: #commitishSelected: 
		to: self. 
	
	self focusOrder 
		add: sidebarTree;
		add: historyPanel