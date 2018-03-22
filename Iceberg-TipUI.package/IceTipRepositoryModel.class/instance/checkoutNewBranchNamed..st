actions
checkoutNewBranchNamed: aString 
	<noCache>

	IceTipStandardAction new 
		message: ('Checking out new branch {1}' format: { aString });
		onSuccessRepositoryModified: self entity;
		execute: [ self entity checkoutNewBranch: aString ]