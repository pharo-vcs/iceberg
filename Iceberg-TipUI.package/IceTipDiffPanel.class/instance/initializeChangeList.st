initialization
initializeChangeList
	| dataSource |
	dataSource := self newChangeTreeDataSource.
	changeList widget dataSource: dataSource.
	dataSource expandAll