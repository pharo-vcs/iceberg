accessing
changes
	cachedChanges ifNil: [
		cachedChanges := changesDictionary values sorted: [ :a :b | a description < b description ] ].
	^ cachedChanges