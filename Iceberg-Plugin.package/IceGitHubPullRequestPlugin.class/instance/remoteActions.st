accessing
remoteActions
	^ { 
	self newPullRequestRemoteAction.
	self removeOldBranchesRemoteAction. 
	}