working-copy
loadWorkingCopyFromCommit: aCommit 
	
	| loader newWorkingCopy mcPackageVersionsToLoad |
	newWorkingCopy := IceWorkingCopy repository: self.
	newWorkingCopy referenceCommit: aCommit.
	
	mcPackageVersionsToLoad := aCommit mcCommit dependencies.
	mcPackageVersionsToLoad
		ifEmpty: [ ^ newWorkingCopy ].

	loader := MCVersionLoader new.
	aCommit mcCommit dependencies do: [ :packageVersionInfo | | packageVersion |
		packageVersion := codeRepository versionWithInfo: packageVersionInfo.
		loader addVersion: packageVersion.
		newWorkingCopy addPackage: packageVersion package.
	].
	loader load.
	
	^ newWorkingCopy