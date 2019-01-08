instance creation
dataSource: aDataSource item: anItem
	^ self new
		dataSource: aDataSource;
		item: anItem;
		yourself