ui
obtainPlaintextCredentials: response 
	| model cancelled |
	
	cancelled := false.
	((model := IceAskForPlaintextCredentialsModel new)
		title: 'Login to GitHub')
		openDialogWithSpec
		okAction: [
			| credentials | 
			credentials := model credentials.

			model storeCredentials 
				ifTrue: [ Credentials := credentials ].

			response readFrom: credentials.
		];
		cancelAction: [ cancelled := true ];
		centered;
		modalRelativeTo: World.

	cancelled ifTrue: [ LGitNoCredentialsProvided signal ]