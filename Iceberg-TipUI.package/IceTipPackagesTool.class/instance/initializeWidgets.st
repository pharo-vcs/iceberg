initialization
initializeWidgets
	super initializeWidgets.
	packageList := self newTable asSpecAdapter.
	self initializePackageList