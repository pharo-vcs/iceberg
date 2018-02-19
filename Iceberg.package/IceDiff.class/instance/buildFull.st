building
buildFull

	self buildSourceDirectory.
	(source referenceCommit changesTo: target), (source loadedPackages
		collect: [ :package | IceImageChange package: package ])
			do: [ :change | change accept: self ].