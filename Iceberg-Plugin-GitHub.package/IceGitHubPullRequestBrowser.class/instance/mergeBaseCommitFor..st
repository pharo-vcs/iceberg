accessing
mergeBaseCommitFor: commitInfo
	^ commitInfo repository lookupCommit: (self mergeBaseFor: commitInfo)