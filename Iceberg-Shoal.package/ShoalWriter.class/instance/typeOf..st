private
typeOf: aClassDefinition
	(self isTrait: aClassDefinition) ifTrue: [ ^ self class traitLabel ].
	(self isClass: aClassDefinition) ifTrue: [ ^ self class classLabel ].
	
	self error: 'I don''t know what to do with this.'
	