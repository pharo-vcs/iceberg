actions
checkout
	<noCache>
	
	IceTipCheckoutBranchAction new 
		repository: self entity repository;
		branch: self entity;
		execute