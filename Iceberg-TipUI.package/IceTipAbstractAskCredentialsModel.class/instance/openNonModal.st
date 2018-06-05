API - opening
openNonModal
	^ self
		openDialogWithSpec
		okAction: [self okAction];
		cancelAction: [self cancelAction];
		centered
		