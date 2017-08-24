querying
mergeBaseWith: anotherCommit
	^ self repository commitAt: 
		(self repository mergeBaseBetween: self id and: anotherCommit id)