private factory
newPackagesListDataSource
	^ IceTipSelectingDataSource new
		tool: self;
		elements: self allPackagesNotRegistered;
		yourself