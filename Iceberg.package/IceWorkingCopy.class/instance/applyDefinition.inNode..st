private-monticello
applyDefinition: anIceDefinition inNode: aNode

	| loader |
	anIceDefinition isFileDefinition ifTrue: [ ^ self ].
	loader := MCPackageLoader new.
	loader addDefinition: anIceDefinition asMCDefinition.
	loader load