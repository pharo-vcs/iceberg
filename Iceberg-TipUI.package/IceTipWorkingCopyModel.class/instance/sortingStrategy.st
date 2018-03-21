accessing
sortingStrategy
	^ sortingStrategy ifNil: [ sortingStrategy := IceSortingStrategy new first: #modified ]