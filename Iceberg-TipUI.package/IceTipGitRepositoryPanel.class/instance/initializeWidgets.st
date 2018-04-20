initialization
initializeWidgets
	super initializeWidgets.
	self initializeRemoteURL.
	self remoteInputText ghostText: 'e.g., ssh://[user@]host.xz[:port]/path/to/repo.git'.
	
	self focusOrder 
		add: self remoteInputText;
		add: self subdirectoryInputText		