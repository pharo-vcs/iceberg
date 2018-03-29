visiting
visitModification: anIceModification 
	
	anIceModification rightDefinition asMCDefinition ifNotNil: #load.
	self visitChildrenOf: currentNode.