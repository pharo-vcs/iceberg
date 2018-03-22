executing
basicExecute
	self fetchAllRemotes.
	(IceTipCheckoutBranchDialog on: self repositoryModel) 
		withoutCreateNewBranch;
		openDialogWithSpec