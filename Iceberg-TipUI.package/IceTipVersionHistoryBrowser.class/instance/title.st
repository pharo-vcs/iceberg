accessing
title
	^ self model  
		ifNotNil: [ 'Versions of {1}' format: { self model name } ]
		ifNil: [ 'Versions' ]