patching
addToPatcher: aMCPatcher 
	
	"We should not handle metaclasses. They will be added automatically when added the instance side"
	self isMeta ifTrue: [ ^ self ].
	
	aMCPatcher addDefinition: self asMCDefinition