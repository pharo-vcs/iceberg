actions
checkoutNewBranchNamed: aString 
	<noCache>

	IceTipStandardAction new 
		repository: self entity;
		message: ('Checking out new branch {1}' format: { aString });
		onSuccessRepositoryModified;
		execute: [ self entity checkoutNewBranch: aString ]