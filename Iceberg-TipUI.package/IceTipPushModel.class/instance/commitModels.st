accessing
commitModels
	^ (self entity outgoingCommitsTo: self remote)
		collect: [ :each | 
			(IceTipCommitModel 
				repositoryModel: self repositoryModel 
				on: each) 
				beCached ]