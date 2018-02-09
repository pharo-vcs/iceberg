building
buildOn: browser
	browser row: #repositories.
	
	browser transmit to: #repositories; andShow: [ :a |
		a fastTable 
			title: 'Repositories';
			display: [ self model repositories ];
			in: [ :this | 
				self addRepositoryActionsOn: this.
				self addRepositorySelectionActionsOn: this ];
			column: 'Name' evaluated: #descriptionText;
			column: 'Status' evaluated: #status;
			enableFilter: [ :each :pattern | each matches: pattern ];
			updateOn: IceTipCacheReseted from: [ self detachedAnnouncer ] ]