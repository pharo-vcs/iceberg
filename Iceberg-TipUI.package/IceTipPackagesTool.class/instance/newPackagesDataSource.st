private factory
newPackagesDataSource
	^ IceTipDataSource new
		menuSelectionContextClass: self contextClass;
		elements: self model packages;
		yourself