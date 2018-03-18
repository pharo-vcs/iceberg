initialization
initializeBranchesList
	branchesList widget
		addColumn: (IceTipTableColumn newAction: #name);
		dataSource: self newBranchListDataSource;
		bindKeyCombination: Character cr toAction: [ self accept ];
		onAnnouncement: FTStrongSelectionChanged do: [ self accept ]