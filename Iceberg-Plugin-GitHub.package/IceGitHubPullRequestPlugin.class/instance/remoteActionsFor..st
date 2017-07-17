accessing
remoteActionsFor: aRemote
	^ { 
	self newPullRequestRemoteAction.
	self viewPullRequestsRemoteAction.
	self removeOldBranchesRemoteAction. 
	}