accessing
refresh
	self model reset.
	changeList widget 
		in: [ :this |
			this selectRowIndexes: #(). 
			this dataSource 
				rootForItems: self model treeRoots;
				expandAll ];
		refresh