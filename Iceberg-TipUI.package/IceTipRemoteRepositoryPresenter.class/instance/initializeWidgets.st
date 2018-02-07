initialization
initializeWidgets
	super initializeWidgets.
	self initializeRemoteURL.
	
	self focusOrder 
		add: self remoteInputText;
		add: self subdirectoryInputText		