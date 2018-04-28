visiting
visitModification: aModification
	
	aModification leftDefinition accept: self.
	self visitChildrenOf: currentNode