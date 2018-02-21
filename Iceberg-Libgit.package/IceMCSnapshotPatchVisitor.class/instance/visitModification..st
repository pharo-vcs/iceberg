visiting
visitModification: anIceModification

	anIceModification modifiedNode addModification: anIceModification toPatcher: patcher.
	self visitChildrenOf: currentNode