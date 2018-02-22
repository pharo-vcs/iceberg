visiting
visitModification: anIceModification

	anIceModification leftDefinition addModification: anIceModification toPatcher: patcher.
	self visitChildrenOf: currentNode