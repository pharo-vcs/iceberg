accessing
refresh
	branchesList widget 
		in: [ :this | 
			this selectRowIndexes: #(). 
			this dataSource 
				rootForItems: self model branchModelsByGroup;
				expandAll ];
		refresh.