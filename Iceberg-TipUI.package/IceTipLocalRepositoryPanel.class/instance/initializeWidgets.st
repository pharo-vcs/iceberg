initialization
initializeWidgets
	super initializeWidgets.
	self focusOrder 
		add: self projectLocation;
		add: self subdirectoryInputText