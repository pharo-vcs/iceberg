private factory
newMCTypeDefinitionFrom: anArray
	| typeClass |
	
	typeClass := self mcDefinitionTypeFor: anArray fourth.
	typeClass = MCClassDefinition ifTrue: [ ^ self newMCClassDefinitionFrom: anArray ].
	typeClass = MCTraitDefinition ifTrue: [ ^ self newMCTraitDefinitionFrom: anArray ].	
	"is extension, no type"
	^ nil