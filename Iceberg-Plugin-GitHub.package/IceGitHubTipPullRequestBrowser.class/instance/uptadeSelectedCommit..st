initialization
uptadeSelectedCommit: anEvent
	self diff selectedModel: (anEvent newSelectedRowIndexes ifNotEmpty: [ :indexes | (self commits widget dataSource elementAt: indexes first)  ] ifEmpty: [ nil ])