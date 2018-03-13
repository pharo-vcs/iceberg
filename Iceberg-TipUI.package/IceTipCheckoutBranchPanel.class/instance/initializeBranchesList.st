initialization
initializeBranchesList
	| dataSource |
	
	dataSource := self newBranchListDataSource.
	branchesList widget 
		useFunction: IceTipTreeFilterFunction do: [ :function | 
			function filterClass: IceTipBranchFilter ];
		dataSource: dataSource.
	dataSource expandAll