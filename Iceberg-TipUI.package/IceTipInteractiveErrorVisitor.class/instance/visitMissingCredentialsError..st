visiting
visitMissingCredentialsError: anError

	((IceTipGitUsernameAndEmailDialog on: self repository)
		onAccept: [ anError resume ];
		openDialogWithSpec)
			modalRelativeTo: World.