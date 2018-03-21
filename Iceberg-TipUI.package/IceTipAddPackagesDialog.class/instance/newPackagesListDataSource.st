private factory
newPackagesListDataSource
	^ IceTipSelectingDataSource new
		tool: self;
		elements: self allPackages;
		yourself