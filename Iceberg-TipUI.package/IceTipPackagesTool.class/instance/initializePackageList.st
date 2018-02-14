initialization
initializePackageList
	packageList widget 
		beResizable;
		addColumn: (IceTipTableColumn new 
			id: 'Name';
			action: #name;
			yourself);
		addColumn: (IceTipTableColumn new 
			id: 'Status';
			action: #status;
			yourself);		
		dataSource: self newPackagesDataSource;
		selectRowIndex: 1;
		enableFilter: FTSubstringFilter;			
		explicitFunction