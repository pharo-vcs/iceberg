accessing
mergeBaseFor: commitInfo
	^ commitInfo repository backend
		mergeBaseBetween: commitInfo commitId 
		and: self baseSHA