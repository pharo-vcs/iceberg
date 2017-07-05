building
buildOn: browser
	browser 
		row: #pullRequests.
		
	browser transmit to: #pullRequests; andShow: [ :a |
		a fastTable 
			selectionAct: [ :presentation | 
				self viewPullRequest: presentation selection ] 
				entitled: 'View pull request...';
			onChangeOfPort: #strongSelection act: [ :presentation | 
				self viewPullRequest: presentation selection ];
			column: '#' evaluated: #number;
			column: 'Title' evaluated: #title;
			column: 'Author' evaluated: #author;
			column: 'State' evaluated: #state ]