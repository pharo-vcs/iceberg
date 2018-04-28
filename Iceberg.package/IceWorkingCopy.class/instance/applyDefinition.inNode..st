private-monticello
applyDefinition: anIceDefinition inNode: aNode

	| loader |
	loader := MCPackageLoader new.
	loader addDefinition: anIceDefinition asMCDefinition.
	loader load