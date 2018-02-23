actions
commit: aCommitIssue then: aBlock
	self withErrorHandlingDo: [ 
		aCommitIssue applyOn: self entity.
		aBlock value ]
