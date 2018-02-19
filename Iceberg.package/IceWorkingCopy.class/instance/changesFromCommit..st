API-changes
changesFromCommit: anIceCommit 
	
	^ (self referenceCommit changesFromCommit: anIceCommit),
		(self modifiedPackages collect: [ :each | 
			IceImageChange package: each ])