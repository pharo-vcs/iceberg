building
buildOn: browser
	browser row: #projects.
	
	browser transmit to: #projects; andShow: [ :a |
		a fastTable 
			title: 'Projects';
			display: [ self model projects ];
			in: [ :this | 
				self addProjectActionsOn: this.
				self addProjectSelectionActionsOn: this ];
			column: 'Name' evaluated: #descriptionText;
			column: 'Status' evaluated: #status;
			enableFilter: [ :each :pattern | each matches: pattern ];
			updateOn: IceTipCacheReseted from: [ self detachedAnnouncer ] ]