initialization
initializeWidgets
	super initializeWidgets.
	remoteLabel label: 'Push to remote:'.
	remoteList setSelectedItem: (self model remoteModels
		detect: #isPushRemote
		ifNone: [ self model remoteModels first ])