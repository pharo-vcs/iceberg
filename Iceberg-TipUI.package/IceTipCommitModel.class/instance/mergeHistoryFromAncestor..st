private
mergeHistoryFromAncestor: anIceGitCommit 
	^ (IceTipCommitRangeModel 
		repositoryModel: self repositoryModel 
		on: anIceGitCommit)
		toCommit: self entity parent;
		beCached