as yet unclassified
visitClassDefinition: anIceClassDefinition 
	
	repository workingCopy applyDefinition: anIceClassDefinition inNode: currentNode.
	self visitChildrenOf: currentNode.