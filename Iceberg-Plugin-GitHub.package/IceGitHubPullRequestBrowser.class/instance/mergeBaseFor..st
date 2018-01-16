accessing
mergeBaseFor: commitInfo
	^ commitInfo repository
		mergeBaseBetween: commitInfo commitId 
		and: self baseSHA