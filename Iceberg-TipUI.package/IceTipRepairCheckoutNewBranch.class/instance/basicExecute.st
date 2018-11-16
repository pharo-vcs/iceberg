executing
basicExecute
	"Fetching remotes is necessary in case the current image commit is not in the repository.
	Could be optimized"
	self fetchAllRemotes.
	(IceTipCheckoutBranchDialog on: self repositoryModel)
		withOnlyNewBranch;
		openDialogWithSpec