initialization
initializeWidgets
	changeList := self newTable.
	diffPanel := self instantiate: SwappedDiffPresenter.

	self initializeChangeList.
	
	changeList widget
		onAnnouncement: FTSelectionChanged 
		send: #selectionChanged:
		to: self