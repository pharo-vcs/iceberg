visiting
visitRemoval: anIceRemoval 

	anIceRemoval definition asMCDefinition ifNotNil: #load.
	self visitChildrenOf: currentNode