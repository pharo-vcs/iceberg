testing
isValidUrl: aRepositoryUrl
	^ self allSubclasses  
		anySatisfy: [ :subclass | subclass canHandleUrl: aRepositoryUrl ]