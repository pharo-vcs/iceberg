initialization
initializePackageList
	packageList widget 
		beResizable;
		addColumn: (IceTipTableColumn new 
			id: 'Name';
			action: #descriptionWithDecoration;
			yourself);
		addColumn: (IceTipTableColumn new 
			id: 'Status';
			action: #statusWithDecoration;
			yourself);		
		dataSource: self newPackagesDataSource;
		selectFirst;
		enableFilter: IceTipPackageFilter;			
		explicitFunction