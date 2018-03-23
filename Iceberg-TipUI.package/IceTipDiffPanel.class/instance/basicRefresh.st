accessing
basicRefresh
	self resetDiffContents.
	changeList widget 
		in: [ :this |
			this selectRowIndexes: #(). 
			this dataSource 
				rootForItems: self model treeRoots;
				expandAll ];
		refresh.
