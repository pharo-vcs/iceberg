execution
execute

	(IceTipCheckoutBranchDialog on: self repositoryModel)
		withTypes: (IcePharoManuscriptPlugin new checkoutBranchPanelsOnModel: self repositoryModel);
		openDialogWithSpec