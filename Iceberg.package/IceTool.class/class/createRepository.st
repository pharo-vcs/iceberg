utilities
createRepository
	[(UIManager default 
			request: 'Enter remote repository URL' 
			initialAnswer: 'git@github.com:'
			title: 'Iceberg repository creation')
		ifNotNil: [ :url | ^ (IceRepository origin: url) register ]]
		on: IceWrongUrl 
		do: [ UIManager default abort: 'The entered URL is not a valid scp repository URL. '  ].
		
	^ nil