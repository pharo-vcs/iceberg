actions
askForPlaintextCredentials: response
	| model cancelled |
	cancelled := false.
	model := IceAskForPlaintextCredentialsModel new.

	model
		openDialogWithSpec
		okAction: [
			| credentials | 
			credentials := 	IcePlaintextCredentials new 
				username: model username;
				password: model password;
				yourself.

			model storeCredentials 
				ifTrue: [ self class plaintextCredentials: credentials ].

			response readFrom: model.
		];
		cancelAction: [ cancelled := true ];
		centered;
		modalRelativeTo: World.

	cancelled ifTrue: [ IceNoCredentialsProvided signal ]
