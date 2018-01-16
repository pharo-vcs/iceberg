accessing
mergeBaseFor: commitInfo

	self flag: #bug.
	"Should use #commonAncestorWith:"
	
	^ commitInfo repository
		mergeBaseBetween: commitInfo commitId 
		and: self baseSHA