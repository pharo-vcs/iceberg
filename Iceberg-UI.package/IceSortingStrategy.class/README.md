I am a sorting strategy taking as parameter a collection and returning the collection sorted. The user can customize the sorting to get, for example, the modified entities first or last. 


Example


	IceSortingStrategy new first: #modified; last: #notLoaded; sort: aCollection

 
Internal Representation and Key Implementation Points.

    Instance Variables
	first:		<aSymbol>		Represent the entities to display first.
	last:		<aSymbol>		Represent the entities to display last.