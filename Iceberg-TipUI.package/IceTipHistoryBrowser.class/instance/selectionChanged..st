event handling
selectionChanged: ann
	commitInfoTabs selectedModel: (ann newSelectedRowIndexes ifNotEmpty: [ :indexes | self commitList widget dataSource elementAt: indexes first ] ifEmpty: [ nil ])