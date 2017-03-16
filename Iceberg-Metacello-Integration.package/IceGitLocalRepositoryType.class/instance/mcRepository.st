accessing
mcRepository
	| repository tuple |
	
	tuple := self splitRootAndSubdirectoryFromLocation.
	repository := IceRepository registry 
		detect: [ :each | each location = tuple first ]
		ifNone: [ 
			(IceRepositoryCreator new 
				location: tuple first;
				addSubdirectory: tuple second;
				createRepository)
				register ].
			
	^ repository metacelloAdapter