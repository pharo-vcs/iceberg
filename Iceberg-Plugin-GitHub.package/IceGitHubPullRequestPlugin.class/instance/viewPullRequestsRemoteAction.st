private actions
viewPullRequestsRemoteAction
	^ GLMGenericAction new
		action: [ :presentation :model | 
			self viewPullRequest: model repository remote: presentation selection ];
		category: 'GitHub';
		showTitle: 'Review pull requests...'; 
		yourself
