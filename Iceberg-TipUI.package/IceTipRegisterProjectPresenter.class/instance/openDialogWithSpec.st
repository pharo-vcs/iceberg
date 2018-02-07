accessing
openDialogWithSpec
	^ super openDialogWithSpec
		okAction: [ acceptAction cull: self selectedType newRepository ];
		yourself