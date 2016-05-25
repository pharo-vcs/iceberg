auxiliar
removeTempDirectories
	self tempDirectories do: [ :location |
		location exists ifTrue: [location deleteAll ]].
