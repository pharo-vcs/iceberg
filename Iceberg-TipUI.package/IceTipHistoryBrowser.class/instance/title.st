accessing
title
	^ self model  
		ifNotNil: [ 'History of {1}' format: { self model name } ]
		ifNil: [ 'History' ]