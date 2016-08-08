changes
mergeBaseDiffToCommit: aCommitInfo
	^ IceDiff 
		from: (self branch lastCommit mergeBaseWith: aCommitInfo) 
		to: aCommitInfo