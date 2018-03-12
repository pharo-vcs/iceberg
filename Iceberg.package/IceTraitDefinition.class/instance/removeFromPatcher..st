patching
removeFromPatcher: aMCPatcher 
	
	"We should not handle metaclasses. They will be added automatically when added the instance side"
	self isMeta ifTrue: [ ^ self ].
	
	aMCPatcher removeDefinition: self asMCDefinition