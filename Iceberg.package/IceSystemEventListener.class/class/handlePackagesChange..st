event handling
handlePackagesChange: packages

	IceRepository registry do: [ :repository | | changed |
		changed := packages anySatisfy: [ :each | each isNotNil and: [ repository notifyPackageModified: each name ] ].
		changed ifTrue: [ 	Iceberg announcer announce: (IceRepositoryModified for: repository) ]]