*Iceberg-Changes
mergeBaseDiffToCommit: aCommitInfo
	^ IceDiff 
		from: (self mergeBaseWith: aCommitInfo) 
		to: aCommitInfo