changes
mergeBaseDiffToCommit: aCommitInfo
	^ IceDiff 
		from: (self mergeBaseWith: aCommitInfo) 
		to: aCommitInfo