initialization
initializeBranchesList
	| dataSource |
	
	dataSource := self newBranchListDataSource.
	branchesList widget
		dataSource: dataSource;
		useFunction: IceTipTreeLinkFilterFunction do: [ :function | 
			function 
				filterClass: IceTipBranchFilter;
				textField: self branchNameText ];
		bindKeyCombination: Character cr toAction: [ self accept ];
		onAnnouncement: FTStrongSelectionChanged do: [ self accept ].
	dataSource expandAll