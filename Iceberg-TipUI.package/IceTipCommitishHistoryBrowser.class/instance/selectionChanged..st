event handling
selectionChanged: ann
	selectedModel := ann newSelectedRowIndexes 
		ifNotEmpty: [ :indexes |(self commitList widget dataSource elementAt: indexes first) ]
		ifEmpty: [ nil ].
	self refreshCommitTabPanel