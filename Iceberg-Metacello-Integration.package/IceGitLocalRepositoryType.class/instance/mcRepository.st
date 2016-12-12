accessing
mcRepository
	| repository tuple |
	
	tuple := self splitRootAndSubdirectoryFromLocation.
	repository := IceRepository registry 
		detect: [ :each | each location = tuple first ]
		ifNone: [ (IceRepository location: tuple first) register ].
	tuple second ifNotNil: [ :dir | repository subdirectory: dir ].
	^ repository metacelloAdapter