accessing
mcRepository
	| repository tuple |
	
	tuple := self splitRootAndSubdirectoryFromLocation.
	repository := IceRepository registry 
		detect: [ :each | each location = tuple first ]
		ifNone: [ 
			(IceRepository location: tuple first) 
				in: [ :this | tuple second ifNotNil: [ :dir | this subdirectory: dir ] ];
				register ].
			
	^ repository metacelloAdapter