accessing
checkoutCommitish: aCommitish
	
	| newWorkingCopy packagestoLoad loader |
	self withRepoDo: [ :repo |
		repo checkout: aCommitish gitRef ].
	
	newWorkingCopy := IceWorkingCopy repository: self.
	newWorkingCopy referenceCommit: aCommitish commit.
	packagestoLoad := self lookupPackagesInDisk.
	packagestoLoad
		ifEmpty: [ ^ newWorkingCopy ].
	
	loader := MCVersionLoader new.
	packagestoLoad do: [ :iceSavedPackage | | packageVersion |
		packageVersion := self mcVersionFor: (IceSavedPackageVersion fromCommit: self head commit package: iceSavedPackage).
		loader addVersion: packageVersion.
		newWorkingCopy addPackage: packageVersion package.
	].
	loader load.
	
	self workingCopy: newWorkingCopy.