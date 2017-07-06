accessing
repositoryActions
	^ { 
	self newPullRequestAction. 
	self viewPullRequestsAction.
	self removeOldBranchesAction. 
	}