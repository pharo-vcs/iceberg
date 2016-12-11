private
stagedPackageNames
	| packageSuffix |
	packageSuffix := '.package'.
	^ self stagedFiles
		select: [ :fileRef | fileRef path segments first endsWith: packageSuffix ]
		thenCollect: [ :fileRef | fileRef path segments first withoutSuffix: packageSuffix ]