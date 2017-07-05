private actions
viewPullRequestsAction
	^ GLMGenericAction new
		action: [ :presenter | self viewPullRequest: presenter selection repository ];
		category: 'GitHub';
		showTitle: 'View pull requests...'; 
		yourself
