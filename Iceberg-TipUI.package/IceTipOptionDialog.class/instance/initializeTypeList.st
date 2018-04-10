initialization
initializeTypeList
	typeList widget 
		addColumn: (IceTipTableColumn newAction: #title icon: #icon);
		dataSource: self newTypeListDataSource;
		onAnnouncement: FTSelectionChanged send: #selectionChanged: to: self.