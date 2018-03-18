initialization
newBranchListDataSource
	^ IceTipDataSource new 
		tool: self;
		elements: self model branchModels;
		yourself.