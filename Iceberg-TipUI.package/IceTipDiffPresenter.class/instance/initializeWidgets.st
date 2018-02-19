initialization
initializeWidgets
	changeList := self newTable.
	diffPanel := self newDiff.

	self initializeChangeList.
	
	changeList widget
		onAnnouncement: FTSelectionChanged 
		send: #selectionChanged:
		to: self