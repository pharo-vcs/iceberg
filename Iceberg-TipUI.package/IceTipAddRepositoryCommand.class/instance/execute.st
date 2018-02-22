execution
execute
	IceTipRegisterRepositoryDialog new
		onAccept: [ :newRepository | self registerRepository: newRepository ];
		openDialogWithSpec