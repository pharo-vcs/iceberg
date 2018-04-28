API-changes
changesTo: aCommitish

	| removedPackages |
	removedPackages := aCommitish packages \ self packages.
	^ (aCommitish changesFromCommit: self referenceCommit),
		((self modifiedPackages, removedPackages) collect: [ :each | 
			IceImageChange package: each ])