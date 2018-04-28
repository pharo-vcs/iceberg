private-monticello
applyDefinition: anIceDefinition 

	| loader |
	loader := MCPackageLoader new.
	loader addDefinition: anIceDefinition asMCDefinition.
	loader load