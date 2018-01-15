accessing
stagedPackages
	^ self stagedPackageNames
		select: [ :each | self includesPackageNamed: each ]
		thenCollect: [ :packageName | self packageNamed: packageName ]