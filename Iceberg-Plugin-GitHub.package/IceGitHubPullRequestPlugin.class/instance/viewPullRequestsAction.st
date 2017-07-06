private actions
viewPullRequestsAction
	^ GLMGenericAction new
		action: [ :presenter | self viewPullRequest: presenter selection repository ];
		category: 'GitHub';
		showTitle: 'Review pull requests...'; 
		yourself
