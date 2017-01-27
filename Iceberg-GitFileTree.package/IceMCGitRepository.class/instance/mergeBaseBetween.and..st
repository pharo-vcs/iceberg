querying
mergeBaseBetween: aCommitId and: anotherCommitId 
	^ (self command: { 'merge-base'. aCommitId. anotherCommitId }) trim