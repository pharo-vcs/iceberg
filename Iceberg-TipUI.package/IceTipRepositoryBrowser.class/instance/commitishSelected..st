initialization
commitishSelected: ann
	| selection |
	selection := sidebarTree widget dataSource realElementAt: ann newSelectedRowIndexes first.
	selection crLog.