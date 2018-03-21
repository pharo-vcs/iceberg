actions
checkoutNewBranchNamed: aString 
	<noCache>

	IceTipStandardUIAction new 
		message: ('Checking out new branch {1}' format: { aString });
		onSuccessRepositoryModified: self entity;
		execute: [ self entity createNewBranch: aString ]