accessing
ancestorShortIdOrOrigin
	^ self entity ancestors 
		ifNotEmpty: [ self ancestorShortId ]
		ifEmpty: [ 'Origin' ]