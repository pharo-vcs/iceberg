patching
addModification: anIceModification toPatcher: aMCPatcher 
	
	"We should not handle metaclasses if their mcDefinition is nil.
	They should be added automatically when added the instance side."
	(self isMeta and: [ mcDefinition isNil ])
		ifTrue: [ ^ self ].
	
	aMCPatcher
		modifyDefinition: anIceModification rightDefinition asMCDefinition
		to: anIceModification leftDefinition asMCDefinition