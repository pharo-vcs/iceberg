accessing
mergeBaseCommitFor: commitInfo
	^ commitInfo repository commitAt: (self mergeBaseFor: commitInfo)