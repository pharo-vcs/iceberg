auxiliar
removeTestDirectory
	{defaultLocation. absoluteLocation} do: [ :location |
		location exists ifTrue: [location deleteAll ]].
