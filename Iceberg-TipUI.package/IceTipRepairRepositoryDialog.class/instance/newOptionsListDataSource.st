private factory
newOptionsListDataSource
	^ IceTipDataSource new 
		tool: self;
		elements: self model availableRepairOptions;
		yourself