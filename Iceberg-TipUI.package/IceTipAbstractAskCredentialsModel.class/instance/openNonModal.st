API - opening
openNonModal
	^ self
		openDialogWithSpec
		okAction: [self okAction];
		cancelAction: [self cancelAction];
		whenClosedDo: [self closeAction];	
		centered
		