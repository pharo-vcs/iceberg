initialization
initializeBranchesList
	branchesList widget
		addColumn: (IceTipTableColumn newAction: #shortDescriptionWithDecoration);
		dataSource: self newBranchListDataSource;
		bindKeyCombination: Character cr toAction: [ self accept ];
		onAnnouncement: FTStrongSelectionChanged do: [ self accept ]