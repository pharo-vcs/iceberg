accessing
children
	
	^ childrenDictionary values sorted: [ :a :b | a key < b key ]