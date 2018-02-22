initialization
initializeWidgets
	super initializeWidgets.	
	
	sidebarTree := self newTable.
	historyPanel := PanelMorph new asSpecAdapter.
	
	self initializeSidebarTree.
	sidebarTree widget
		onAnnouncement: FTSelectionChanged 
		send: #commitishSelected: 
		to: self. 
	
	self focusOrder 
		add: sidebarTree;
		add: historyPanel