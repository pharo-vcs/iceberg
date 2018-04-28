visiting
visitModification: anIceModification 
	
	repository workingCopy applyDefinition: anIceModification definition.
	self visitChildrenOf: currentNode