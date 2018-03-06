initialization
initializeSidebarTree
	| dataSource |
	dataSource := self newSidebarTreeDataSource.
	sidebarTree widget 
		color: Color transparent;
		dataSource: dataSource.
	dataSource expandRoots.
	self selectCurrentBranch.