initialization
initializeRepositoryList
	repositoryList widget 
		beResizable;
		addColumn: (IceTipTableColumn new 
			id: 'Name';
			action: #name;
			yourself);
		addColumn: (IceTipTableColumn new 
			id: 'Status';
			action: #status;
			yourself);		
		dataSource: self newRepositoriesDataSource;
		selectRowIndex: 1;
		enableFilter: FTSubstringFilter;			
		explicitFunction