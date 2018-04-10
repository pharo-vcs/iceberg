private factory
newPackagesDataSource
	^ IceTipDataSource new
		tool: self;
		elements: self model packageModels;
		yourself