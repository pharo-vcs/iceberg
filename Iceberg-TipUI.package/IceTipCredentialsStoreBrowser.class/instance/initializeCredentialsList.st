initialization
initializeCredentialsList

	credentialsList widget 
		beResizable;
		addColumn: (IceTipTableColumn new 
			id: 'Host';
			action: #hostDescription;
			width: 100;
			yourself);
		addColumn: (IceTipTableColumn new 
			id: 'Type';
			action: #type;
			width: 75;
			yourself);
		addColumn: (IceTipTableColumn new 
			id: 'Description';
			action: #description;
			yourself);		
		dataSource: self newCredentialsDataSource;
		selectRowIndex: 1;
		enableFilter: IceTipRepositoryFilter;			
		explicitFunction