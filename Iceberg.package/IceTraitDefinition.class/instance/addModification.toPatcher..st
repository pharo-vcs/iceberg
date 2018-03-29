patching
addModification: anIceModification toPatcher: aMCPatcher 
	
	"We should not handle metaclasses. They will be added automatically when added the instance side"
	self isMeta ifTrue: [ ^ self ].
	
	aMCPatcher
		modifyDefinition: anIceModification rightDefinition asMCDefinition
		to: anIceModification leftDefinition asMCDefinition