actions
accept
	| title |
	
	title := self titlePanel text trim.
	title ifEmpty: [ 
		UIManager default alert: 'You need to specify a title for the pull request.' title: 'Error'. 
		^ self ].
	
	acceptBlock ifNotNil: [ 
		acceptBlock cull: (IceGitHubPullRequest new 
			title: title;
			head: self headPanel selectedItem;
			base: self basePanel selectedItem;
			body: self bodyPanel text trim;
			yourself)	 ].
	
	self window delete.