initialization
initializeWidgets

	notebookPanel := self newNotebook.
	self initializeCommitPanel.
	
	self focusOrder add: notebookPanel