accessing
refresh
	packagesList widget 
		in: [ :this | 
			this selectRowIndexes: #(). 
			this dataSource 
				rootForItems: self model repositoryModelsByGroup;
				expandAll ];
		refresh.