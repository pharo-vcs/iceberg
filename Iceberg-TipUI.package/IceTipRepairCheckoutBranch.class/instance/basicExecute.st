executing
basicExecute
	self fetchAllRemotes.
	(IceTipCheckoutBranchDialog on: self repositoryModel) 
		withoutNewBranch;
		openDialogWithSpec