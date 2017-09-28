accessing
sortingStrategy
	^ SortingStrategy ifNil: [ SortingStrategy := IceSortingStrategy new ]