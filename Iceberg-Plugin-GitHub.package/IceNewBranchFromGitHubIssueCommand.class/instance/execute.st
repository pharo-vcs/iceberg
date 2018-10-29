execution
execute

	(IceTipCheckoutBranchDialog on: self repositoryModel)
		withTypes: (IceGitHubPlugin new checkoutBranchPanelsOnModel: self repositoryModel);
		openDialogWithSpec