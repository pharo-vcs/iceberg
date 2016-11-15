actions
askForPlaintextCredentials: credentials
	| model cancelled |
	cancelled := false.
	model := IceAskForPlaintextCredentialsModel new.

	model
		openDialogWithSpec
		okAction: [ 
			credentials 
				username: model username;
				passphrase: model password.
			
			model storeCredentials ifTrue: [ 
				self class 
					username: model username;
					password: model password.
			]
		];
		cancelAction: [ cancelled := true ];
		centered;
		modalRelativeTo: World.

	cancelled ifTrue: [ IceNoCredentialsProvided signal ]
