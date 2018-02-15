private factory
newRepositoriesDataSource
	^ IceTipDataSource new
		menuSelectionContextClass: self contextClass;
		elements: self model repositories;
		yourself