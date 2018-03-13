initialization
initializeBranchesList
	| dataSource |
	
	dataSource := self newBranchListDataSource.
	branchesList widget
		dataSource: dataSource;
		useFunction: IceTipTreeLinkFilterFunction do: [ :function | 
			function 
				filterClass: IceTipBranchFilter;
				textField: self branchNameText ].
	dataSource expandAll