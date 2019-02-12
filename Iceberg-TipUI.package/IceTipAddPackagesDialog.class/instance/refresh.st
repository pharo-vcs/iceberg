accessing
refresh
	packagesList widget 
		in: [ :this | 
			this deselectAll.
			this dataSource 
				rootForItems: self model repositoryModelsByGroup;
				expandAll ];
		refresh.