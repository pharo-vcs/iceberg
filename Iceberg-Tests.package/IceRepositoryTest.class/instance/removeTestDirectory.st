auxiliar
removeTestDirectory
	{defaultLocation. absoluteLocation} do: [ :location |
		location exists ifTrue: [defaultLocation deleteAll ]].
