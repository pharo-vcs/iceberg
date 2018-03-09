initialization
initializeWidgets
	super initializeWidgets.
	packageList := self newTable.
	statusBar := self instantiate: IceTipStatusBar.

	self initializePackageList.
	self initializeStatusBar.
	
	self focusOrder add: packageList