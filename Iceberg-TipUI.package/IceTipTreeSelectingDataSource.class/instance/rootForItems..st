accessing
rootForItems: aCollection
 	selectedItems := Set new.	
	self rootItem: (FTRootItem new
		data: aCollection;
		yourself)