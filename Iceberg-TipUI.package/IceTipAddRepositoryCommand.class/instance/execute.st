execution
execute
	IceTipRegisterRepositoryPresenter new
		onAccept: [ :newRepository | self registerRepository: newRepository ];
		openDialogWithSpec