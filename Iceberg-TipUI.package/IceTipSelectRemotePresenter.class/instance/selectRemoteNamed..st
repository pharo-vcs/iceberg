accessing
selectRemoteNamed: aString
	remoteList setSelectedItem: (self model remoteModels detect: [ :each | each name = aString ])