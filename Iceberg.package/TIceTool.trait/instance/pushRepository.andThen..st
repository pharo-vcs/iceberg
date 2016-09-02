utilities
pushRepository: repository andThen: aBlock
	[ 
		repository push. 
		aBlock value.
	] 
	on: YouShouldPullBeforePush
	do: [ 
		self uiManager
			abort: 'Publish operation is not possible because your repository is out of date. 
Please update your local repository and retry.'
			title: 'Publishing aborted' 
	]
