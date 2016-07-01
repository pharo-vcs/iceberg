instance creation
url: aRepositoryUrl
	self subclasses 
		detect: [ :subclass | subclass canHandleUrl: aRepositoryUrl ]
		ifFound: [ :subclass | ^ subclass new url: aRepositoryUrl ]
		ifNone: [ self error: 'Remote repository scheme not supported: ', aRepositoryUrl ]