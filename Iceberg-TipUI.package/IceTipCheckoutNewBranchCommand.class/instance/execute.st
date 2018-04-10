execution
execute

	(IceTipCheckoutNewBranchPanel on: self repositoryModel)
		commitish: selectedCommit entity;
		withResultDo: [ :branch | branch checkout ];
		openDialogWithSpec