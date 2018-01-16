API-loading
checkoutPackagesNamed: aCollection fromCommit: aCommit
	
	| loader |
	loader := MCVersionLoader new.
	aCollection do: [ :name | | packageVersion |
		packageVersion := (IceSavedPackageVersion
			fromCommit: aCommit
			package: (IceSavedPackage named: name repository: repository))
				mcVersion.
		loader addVersion: packageVersion.
	].
	loader load.