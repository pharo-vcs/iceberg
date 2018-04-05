accessing
commitModelFor: aCommit
	^ (IceTipCommitModel 
		repositoryModel: self 
		on: aCommit)
		beCached