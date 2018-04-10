patching
addModification: anIceModification toPatcher: aMCPatcher 
	
	aMCPatcher
		modifyDefinition: anIceModification rightDefinition asMCDefinition
		to: anIceModification leftDefinition asMCDefinition