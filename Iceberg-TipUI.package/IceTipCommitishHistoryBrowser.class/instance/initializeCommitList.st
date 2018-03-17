initialization
initializeCommitList
	commitList widget 
		beResizable;
		addColumn: (IceTipTableColumn new 
			id: 'Timestamp';
			action: [ :each | each timeStamp asLocalStringYMDHM ];
			width: 110;
			yourself);
		addColumn: (IceTipTableColumn new 
			id: 'Commit';
			action: #shortId;
			width: 60;
			yourself);		
		addColumn: (IceTipTableColumn new 
			id: 'Description';
			action: #descriptionWithDecoration;
			yourself);		
		dataSource: self newCommitsDataSource;
		selectRowIndex: 1