accessing
refresh
	self model reset.
	self resetDiffContents.
	changeList widget
		in: [ :this | 
			this basicSelectIndexes: #().
			this dataSource
				rootForItems: self model treeRoots;
				selectAll;
				expandAll ];
		refresh