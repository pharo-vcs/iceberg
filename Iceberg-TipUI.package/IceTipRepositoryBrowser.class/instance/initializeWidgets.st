initialization
initializeWidgets
	super initializeWidgets.	
	
	sidebarTree := self newOutline.
	historyPanel := self instantiate: IceTipHistoryBrowser on: self model branchModel.
	
	self initializeSidebarTree.
	sidebarTree widget
		onAnnouncement: FTSelectionChanged 
		send: #commitishSelected: 
		to: self. 
	
	self focusOrder 
		add: historyPanel;
		add: sidebarTree
		