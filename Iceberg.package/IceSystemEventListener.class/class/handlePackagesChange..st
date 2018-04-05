class initialization
handlePackagesChange: packages

	IceRepository registry do: [ :repository | | changed |
		changed := packages anySatisfy: [ :each | 
			repository notifyPackageModified: each name ].
		changed ifTrue: [ 
			Iceberg announcer announce: (IceRepositoryModified for: repository) ]]