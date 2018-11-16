executing
basicExecute
	self fetchAllRemotes.
	(IceTipMergeBranchDialog on: self repositoryModel) 
		beSwitchAndMerge;
		openDialogWithSpec