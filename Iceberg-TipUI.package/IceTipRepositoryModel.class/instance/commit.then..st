actions
commit: aCommitIssue then: aBlock
	UIManager default 
		informUser: 'Commiting...' 
		during: [ 
			self withErrorHandlingDo: [ 
				aCommitIssue applyOn: self entity.
				aBlock value ] ]