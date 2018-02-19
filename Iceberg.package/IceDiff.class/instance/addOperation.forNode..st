private-building
addOperation: anOperation forNode: aNode
	
	(operations at: aNode ifAbsentPut: [ Set new ])
		add: anOperation