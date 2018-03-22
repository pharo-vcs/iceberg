executing
basicExecute
	self fetchAllRemotes.
	(IceTipCheckoutNewBranchPanel on: self repositoryModel) openDialogWithSpec