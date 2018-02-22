event handling
selectionChanged: ann
	selectedModel := (self commitList widget dataSource elementAt: ann newSelectedRowIndexes first).
	self refreshCommitTabPanel