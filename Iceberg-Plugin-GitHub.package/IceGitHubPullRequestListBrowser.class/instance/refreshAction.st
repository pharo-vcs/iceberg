building
refreshAction
	^ GLMGenericAction new
		action: [ :presentation |
			UIManager default
				informUser: 'Refreshing pull request list' 
				during: [ self refreshPullRequests ].
			presentation update ];
		icon: (self iconNamed: #refresh);
		title: 'Refresh'; 
		showTitle