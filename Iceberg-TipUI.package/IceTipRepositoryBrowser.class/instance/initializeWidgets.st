initialization
initializeWidgets
	super initializeWidgets.	
	
	sidebarTree := self newIceOutline.
	historyPanel := self instantiate: IceTipHistoryBrowser on: self model headModel.
	historyPanel beForMerge.
	
	self initializeSidebarTree.
	sidebarTree widget
		onAnnouncement: FTSelectionChanged 
		send: #commitishSelected: 
		to: self. 
	
	self focusOrder 
		add: historyPanel;
		add: sidebarTree
		