private
cypressMethodClassExtension: aMethod 
	aMethod isExtension ifTrue: [ ^ '.extension' ].
	aMethod origin isTrait ifTrue: [ ^ '.trait' ].
	^ '.class'