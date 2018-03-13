accessing
path
	^ self parent 
		ifNotNil: [ :p | p path, { self } ]
		ifNil: [ { self } ]