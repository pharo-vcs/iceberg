initialization
initializeSidebarTree
	| dataSource |
	dataSource := self newSidebarTreeDataSource.
	sidebarTree widget dataSource: dataSource.
	dataSource expandRoots