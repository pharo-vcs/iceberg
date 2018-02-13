accessing
mergeBaseFor: commitInfo

	self flag: #bug.
	"Should use #commonAncestorWith:"
	
	^ commitInfo repository
		mergeBaseBetween: commitInfo id 
		and: self baseSHA