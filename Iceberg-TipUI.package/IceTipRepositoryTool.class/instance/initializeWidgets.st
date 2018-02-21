initialization
initializeWidgets
	super initializeWidgets.	
	
	sidebarTree := self newTable.
	historyPanel := PanelMorph new asSpecAdapter.
	
	self initializeSidebarTree.
	
	self focusOrder 
		add: sidebarTree;
		add: historyPanel