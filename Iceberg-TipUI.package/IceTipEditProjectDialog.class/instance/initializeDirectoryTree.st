initialization
initializeDirectoryTree
		
	| dataSource |
	dataSource := self newDirectoryDataSource.
	sourceDirectoryTree widget
		addColumn: (IceTipTableColumn newAction: #name icon: [ :each | self iconNamed: #package ]);
		dataSource: dataSource;
		onAnnouncement: FTSelectionChanged do: [ :announcement | 
			self sourceDirectorySelectionChanged: announcement newSelectedRowIndexes ]