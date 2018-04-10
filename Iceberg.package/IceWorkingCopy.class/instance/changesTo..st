API-changes
changesTo: aCommitish
	
	^ (aCommitish changesFromCommit: self referenceCommit),
		(self modifiedPackages collect: [ :each | 
			IceImageChange package: each ])