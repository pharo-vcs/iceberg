accessing
openDialogWithSpec
	^ super openDialogWithSpec
		okAction: [ self doAccept ];
		yourself