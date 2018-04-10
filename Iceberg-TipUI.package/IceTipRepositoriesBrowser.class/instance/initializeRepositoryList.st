initialization
initializeRepositoryList
	repositoryList widget 
		beResizable;
		addColumn: (IceTipTableColumn new 
			id: 'Name';
			action: #descriptionWithDecoration;
			yourself);
		addColumn: (IceTipTableColumn new 
			id: 'Status';
			action: #status;
			yourself);		
		dataSource: self newRepositoriesDataSource;
		selectRowIndex: 1;
		enableFilter: IceTipRepositoryFilter;			
		explicitFunction