execution
execute
	IceTipRegisterProjectPresenter new
		onAccept: [ :newRepository | self registerRepository: newRepository ];
		openDialogWithSpec