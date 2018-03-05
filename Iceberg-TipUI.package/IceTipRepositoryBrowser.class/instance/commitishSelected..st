event handling
commitishSelected: ann
	| selection |
	selection := sidebarTree widget dataSource elementAt: ann newSelectedRowIndexes first.
	selection hasChildren ifTrue: [ ^ self "just refresh on leafs" ].
	historyPanel model: selection data