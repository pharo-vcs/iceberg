initialization
initializeRepositoryList
	repositoryList widget 
		beResizable;
		addColumn: (IceTipTableColumn new 
			id: 'Name';
			action: #descriptionWithDecoration;
			width: 200;
			yourself);
		addColumn: (IceTipTableColumn new 
			id: 'Branch';
			action: #branchName;
			width: 150;
			yourself);
		addColumn: (IceTipTableColumn new 
			id: 'Status';
			action: #status;
			yourself);		
		dataSource: self newRepositoriesDataSource;
		selectRowIndex: 1;
		enableFilter: IceTipRepositoryFilter;			
		explicitFunction