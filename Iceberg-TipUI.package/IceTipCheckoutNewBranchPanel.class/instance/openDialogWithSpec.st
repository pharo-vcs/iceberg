api
openDialogWithSpec
	^ super openDialogWithSpec
		okAction: [ self accept ];
		yourself