actions
commit: aCommitIssue then: aBlock

	aCommitIssue 
		repository: self entity;
		onSuccess: aBlock;
		execute