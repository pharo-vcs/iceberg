initialization
initializeOptionsList
	optionsList widget 
		addColumn: (IceTipTableColumn newAction: #title icon: #icon);
		dataSource: self newOptionsListDataSource;
		bindKeyCombination: Character cr toAction: [ self accept ];
		onAnnouncement: FTSelectionChanged send: #selectionChanged: to: self;
		onAnnouncement: FTStrongSelectionChanged send: #accept to: self.