building
buildOn: browser
	browser 
		row: #pullRequests;
		row: #detail span: 2.
		
	browser transmit to: #pullRequests; andShow: [ :a |
		a fastTable 
			title: 'Open pull requests';
			addAction: self refreshAction;
			selectionAct: [ :presentation | 
				self viewPullRequest: presentation selection ] 
				entitled: 'Review pull request...';
			onChangeOfPort: #strongSelection act: [ :presentation | 
				self viewPullRequest: presentation selection ];
			column: '#' evaluated: #number width: 50;
			column: 'State' evaluated: #state width: 50;
			column: 'Author' evaluated: #author width: 120;
			column: 'Title' evaluated: #title ].
		
	browser transmit from: #pullRequests; to: #detail; andShow: [ :a |
		a morph 
			title: [ :pr | '#{1} {2}' format: {pr number. pr title} ];
			morph: [ :presentation :pr | (IceGitHubPullRequestDetailModel for: pr) buildWithSpec ] ]