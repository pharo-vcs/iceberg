initialization
initializeWidgets
	super initializeWidgets.
	packageList := self newTable.
	self initializePackageList.
	
	self focusOrder add: packageList