visiting
visitModification: anIceModification 
	1halt.
	anIceModification modifiedNode addModification: anIceModification toPatcher: patcher.
	self visitChildrenOf: currentNode