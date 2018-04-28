as yet unclassified
visitClassDefinition: anIceClassDefinition 
	
	repository workingCopy applyDefinition: anIceClassDefinition.
	self visitChildrenOf: currentNode.