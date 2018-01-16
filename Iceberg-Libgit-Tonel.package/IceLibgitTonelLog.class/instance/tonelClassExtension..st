private
tonelClassExtension: aClass
	aClass isTrait ifTrue: [ ^ '.trait' ].
	^ '.class'