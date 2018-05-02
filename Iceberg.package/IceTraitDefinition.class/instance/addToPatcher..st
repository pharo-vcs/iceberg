patching
addToPatcher: aMCPatcher 
	
	"We should not handle metaclasses if their mcDefinition is nil.
	They should be added automatically when added the instance side."
	(self isMeta and: [ mcDefinition isNil ])
		ifTrue: [ ^ self ].

	"We should only be in this case if there is not instace-side changes."
	aMCPatcher addDefinition: self asMCDefinition