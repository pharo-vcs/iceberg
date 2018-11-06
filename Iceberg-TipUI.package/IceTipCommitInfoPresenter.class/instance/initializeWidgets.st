initialization
initializeWidgets
	commitTabPanel := self newTabManager.
	
	self initializeCommitPanel.
	
	self focusOrder add: commitTabPanel