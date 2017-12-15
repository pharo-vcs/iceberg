instance creation
url: aRepositoryUrl
	self withAllSubclasses  
		detect: [ :subclass | subclass canHandleUrl: aRepositoryUrl ]
		ifFound: [ :subclass | ^ subclass new url: aRepositoryUrl ]
		ifNone: [ IceWrongUrl signal: 'Remote repository scheme not supported: ', aRepositoryUrl ]