accessing
commitModels
	^ (self fromCommit newCommitWalk uptoCommit: self toCommit) commits 
		collect: [ :each |
			(IceTipCommitModel 
				repositoryModel: self repositoryModel 
				on: each) 
				beCached ]
		