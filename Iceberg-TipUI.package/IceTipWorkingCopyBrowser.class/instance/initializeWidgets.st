initialization
initializeWidgets
	super initializeWidgets.
	packageList := self newIceTable.
	statusBar := self instantiate: IceTipStatusBar.

	self initializePackageList.
	self initializeStatusBar.
	
	self focusOrder add: packageList