initialization
uptadeSelectedCommit: anEvent
	self diff selectedModel: (anEvent newSelectedIndexes
		ifNotEmpty: [ :indexes | (self commits widget dataSource elementAt: indexes first)  ]
		ifEmpty: [ nil ])