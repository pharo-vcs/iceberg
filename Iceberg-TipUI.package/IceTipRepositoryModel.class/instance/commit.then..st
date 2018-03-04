actions
commit: aCommitIssue then: aBlock
	aCommitIssue 
		repository: self entity;
		onFinish: aBlock;
		execute. 