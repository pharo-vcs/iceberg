accessing
openDialogWithSpec
	^ super openDialogWithSpec
		okAction: [ self accept ];
		yourself