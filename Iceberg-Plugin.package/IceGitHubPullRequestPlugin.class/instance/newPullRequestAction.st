private actions
newPullRequestAction
	^ GLMGenericAction new
		action: [ :presenter | self newPullRequestFor: presenter selection repository ];
		category: 'GitHub';
		showTitle: 'Create pull request...'; 
		yourself
