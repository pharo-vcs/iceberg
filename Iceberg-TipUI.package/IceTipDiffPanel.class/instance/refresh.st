accessing
refresh
	self model reset.
	self resetDiffContents.
	changeList widget 
		in: [ :this |
			this selectRowIndexes: #(). 
			this dataSource 
				rootForItems: self model treeRoots;
				expandAll ];
		refresh.
