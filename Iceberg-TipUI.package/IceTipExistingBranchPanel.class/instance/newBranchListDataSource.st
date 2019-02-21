initialization
newBranchListDataSource
	^ IceTipDataSource new
		tool: self;
		elements: self branchModels;
		yourself