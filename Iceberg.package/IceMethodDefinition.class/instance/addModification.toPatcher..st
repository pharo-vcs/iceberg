patching
addModification: anIceModification toPatcher: aMCPatcher 
	
	aMCPatcher
		modifyDefinition: anIceModification oldDefinition asMCDefinition
		to: anIceModification newDefinition asMCDefinition