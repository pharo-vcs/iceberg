private factory
newTypeDefinitionFrom: anArray
	| typeClass |
	
	typeClass := self definitionForType: anArray fourth.
	typeClass = MCClassDefinition ifTrue: [ ^ self newClassDefinitionFrom: anArray ].
	typeClass = MCTraitDefinition ifTrue: [ ^ self newTraitDefinitionFrom: anArray ].	
	"is extension, no type"
	^ nil