visiting
visitRemoval: anIceRemoval

	anIceRemoval definition asMCDefinition ifNotNil: #unload.
	self visitChildrenOf: currentNode