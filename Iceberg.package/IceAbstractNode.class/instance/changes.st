accessing
changes
	cachedChanges ifNil: [
		cachedChanges := changesDictionary values sorted: [ :a :b | a sortKey < b sortKey ] ].
	^ cachedChanges