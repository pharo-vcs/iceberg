initialization
initializePackageList
	packageList widget 
		beResizable;
		addColumn: (IceTipTableColumn new 
			id: 'Name';
			action: #descriptionText;
			yourself);
		addColumn: (IceTipTableColumn new 
			id: 'Status';
			action: #statusText;
			yourself);		
		dataSource: self newPackagesDataSource;
		selectRowIndex: 1;
		enableFilter: FTSubstringFilter;			
		explicitFunction