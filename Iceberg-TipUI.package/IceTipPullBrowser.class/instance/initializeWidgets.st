initialization
initializeWidgets
	super initializeWidgets.
	remoteLabel label: 'Pull from remote:'.
	remoteList setSelectedItem: (self model remoteModels 
		detect: #isPullRemote
		ifNone: [ self model remoteModels first ])