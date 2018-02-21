patching
removeFromPatcher: aMCPatcher 
	
	"We should not handle metaclasses. They will be removed automatically if the instance side is removed"
	isMeta ifTrue: [ ^ true ].
	
	aMCPatcher removeDefinition: self asMCDefinition 