initialization
initializeWidgets
	super initializeWidgets.
	remoteLabel label: 'Pull from remote:'.
	remoteList setSelectedItem: (self model branch upstream remote
		ifNil: [ self model remoteModels first ])