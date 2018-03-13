initialization
initializeBranchesList
	| dataSource |
	
	dataSource := self newBranchListDataSource.
	branchesList widget 
		useFunction: IceTipTreeLinkFilterFunction do: [ :function | 
			function 
				filterClass: IceTipBranchFilter;
				textField: self branchNameText ];
		dataSource: dataSource.
	dataSource expandAll