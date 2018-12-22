initialization
newPullRequestsDataSource
	^ IceTipDataSource new 
		tool: self;
		elements: #();
		yourself