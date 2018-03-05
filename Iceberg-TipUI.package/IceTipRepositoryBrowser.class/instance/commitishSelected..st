event handling
commitishSelected: ann
	| selection |
	selection := sidebarTree widget dataSource elementAt: ann newSelectedRowIndexes first.
	selection depth = 0 ifTrue: [ ^ self "do not refresh on root" ].
	historyPanel model: selection data