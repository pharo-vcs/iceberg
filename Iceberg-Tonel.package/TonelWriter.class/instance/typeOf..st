private
typeOf: aClassDefinition
	(self isClass: aClassDefinition) ifTrue: [ ^ self class classLabel ].
	(self isTrait: aClassDefinition) ifTrue: [ ^ self class traitLabel ].

	TonelShouldIgnore signal