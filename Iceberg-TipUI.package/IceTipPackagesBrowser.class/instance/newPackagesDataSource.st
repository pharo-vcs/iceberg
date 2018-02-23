private factory
newPackagesDataSource
	^ IceTipDataSource new
		tool: self;
		elements: self model packages;
		yourself