merging
mergeCommit: mergeCommit
	
	1halt.
	^ IceMerge new
		repository: self repository;
		mergeCommit: mergeCommit;
		execute.