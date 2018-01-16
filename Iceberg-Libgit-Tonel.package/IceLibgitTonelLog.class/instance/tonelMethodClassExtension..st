private
tonelMethodClassExtension: aMethod
	aMethod isExtension ifTrue: [ ^ '.extension' ].
	aMethod origin isTrait ifTrue: [ ^ '.trait' ].
	^ '.class'
	