adding
addOperation: anOperation forNode: aNode
	
	| nodeOperations |
	nodeOperations := operations at: aNode description ifAbsentPut: [ Set new ].
	self assert: nodeOperations isEmpty.
	nodeOperations add: anOperation