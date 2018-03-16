actions
checkoutNewBranchNamed: aString 
	<noCache>
	
	IceTipCheckoutNewBranchAction new
		repository: self entity;
		branchName: aString;
		execute