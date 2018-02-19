initialization
selectionChanged: ann
	selectedCommit := (self commitList widget dataSource elementAt: ann newSelectedRowIndexes first).
	self refreshCommitPanel