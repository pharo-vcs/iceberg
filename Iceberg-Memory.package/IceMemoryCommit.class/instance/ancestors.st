accessing
ancestors
	
	^ self mcCommit info ancestors collect: [ :parentMcCommitInfo | | iceCommit parentMcCommit |
		parentMcCommit := repository branchRepository versionWithInfo: parentMcCommitInfo.
		iceCommit := IceMemoryCommit new.
		iceCommit repository: repository.
		iceCommit mcCommit: parentMcCommit.
		iceCommit ]