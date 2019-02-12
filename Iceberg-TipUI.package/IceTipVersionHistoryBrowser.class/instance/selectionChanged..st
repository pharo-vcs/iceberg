event handling
selectionChanged: ann
	selectedModel := ann newSelectedIndexes 
		ifNotEmpty: [ :indexes |(self commitList widget dataSource elementAt: indexes first) ]
		ifEmpty: [ nil ].
	self refreshCommitTabPanel