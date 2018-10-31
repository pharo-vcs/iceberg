initialization
initializePullRequestsTable
	pullRequests widget
		beResizable;
		addColumn:
			(IceTipTableColumn new
				id: '#';
				action: [ :pullRequest | pullRequest number asString ];
				width: 50 * World displayScaleFactor;
				yourself);
		addColumn:
			(IceTipTableColumn new
				id: 'State';
				action: #state;
				width: 50 * World displayScaleFactor;
				yourself);
		addColumn:
			(IceTipTableColumn new
				id: 'Author';
				action: #author;
				width: 120 * World displayScaleFactor;
				yourself);
		addColumn:
			(IceTipTableColumn new
				id: 'Title';
				action: #title;
				yourself);
		dataSource: self newPullRequestsDataSource