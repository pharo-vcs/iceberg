initialization
initializeWidgets
	super initializeWidgets.
	remoteLabel label: 'Push to remote:'.
	remoteList setSelectedItem: self model remote