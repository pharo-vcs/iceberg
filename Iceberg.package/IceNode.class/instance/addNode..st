adding
addNode: aNode
	
	childrenDictionary at: aNode key ifPresent: [ self halt ].
	self at: aNode key put: aNode.
	^ aNode