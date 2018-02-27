initialization
initializeWidgets
	changeList := self newTable.
	diffPanel := self instantiate: DiffPresenter.

	self initializeChangeList.
	self initializeDiffPanel.
	
	changeList widget
		onAnnouncement: FTSelectionChanged 
		send: #selectionChanged:
		to: self.
		
	self focusOrder 
		add: changeList;
		add: diffPanel.
