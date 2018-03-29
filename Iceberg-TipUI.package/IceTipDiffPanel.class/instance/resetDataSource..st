private
resetDataSource: aDataSource
	^ aDataSource 
		rootForItems: self model treeRoots;
		expandAll