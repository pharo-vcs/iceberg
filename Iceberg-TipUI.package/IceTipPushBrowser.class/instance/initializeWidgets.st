initialization
initializeWidgets
	super initializeWidgets.
	remoteList setSelectedItem: (self model remotes detect: #isPushRemote)