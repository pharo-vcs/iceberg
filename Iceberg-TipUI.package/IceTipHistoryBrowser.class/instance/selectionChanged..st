event handling
selectionChanged: ann
	commitInfoTabs selectedModel: (ann newSelectedIndexes
		ifNotEmpty: [ :indexes | self commitList widget dataSource elementAt: indexes first ]
		ifEmpty: [ nil ])