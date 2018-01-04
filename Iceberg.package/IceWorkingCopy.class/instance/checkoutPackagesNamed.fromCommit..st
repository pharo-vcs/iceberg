actions
checkoutPackagesNamed: aCollection fromCommit: aCommit
	
	| loader |
	loader := MCVersionLoader new.
	aCollection do: [ :iceSavedPackage | | packageVersion |
		packageVersion := (IceSavedPackageVersion
			fromCommit: aCommit
			package: (IceSavedPackage named: iceSavedPackage repository: repository))
				mcVersion.
		loader addVersion: packageVersion.
	].
	loader load.