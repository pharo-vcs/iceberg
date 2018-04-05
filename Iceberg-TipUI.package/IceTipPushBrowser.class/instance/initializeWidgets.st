initialization
initializeWidgets
	super initializeWidgets.
	remoteLabel label: 'Push to remote:'.
	remoteList setSelectedItem: (self model branch upstream remote
		ifNil: [ self model remoteModels first ])