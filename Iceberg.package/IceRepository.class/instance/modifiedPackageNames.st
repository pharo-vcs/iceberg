actions
modifiedPackageNames
	| packageSuffix |
	packageSuffix := '.package'.
	^ self modifiedFiles
		select: [ :fileRef | fileRef path segments first endsWith: packageSuffix ]
		thenCollect: [ :fileRef | fileRef path segments first withoutSuffix: packageSuffix ]