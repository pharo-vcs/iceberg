private-operations
checkoutCommitish: aCommitish
	
	| newWorkingCopy packagestoLoad loader |
	self withRepoDo: [ :repo |
		repo checkout: aCommitish gitRef ].
	
	newWorkingCopy := IceWorkingCopy repository: self frontend.
	newWorkingCopy referenceCommit: aCommitish commit.
	newWorkingCopy loadedVersions: Dictionary new.
	
	packagestoLoad := self lookupPackages.
	packagestoLoad
		ifEmpty: [ ^ newWorkingCopy ].
	
	loader := MCVersionLoader new.
	packagestoLoad do: [ :iceSavedPackage | | packageVersion |
		packageVersion := (self lookupHead newCommitWalk firstCommit versionFor: iceSavedPackage) mcVersion.
		loader addVersion: packageVersion.
		newWorkingCopy addPackage: packageVersion package.
	].
	loader load.
	
	self frontend workingCopy: newWorkingCopy.