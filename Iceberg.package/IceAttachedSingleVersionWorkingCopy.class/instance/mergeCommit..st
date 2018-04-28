merging
mergeCommit: mergeCommit
	
	^ IceMerge new
		repository: self repository;
		mergeCommit: mergeCommit;
		execute.