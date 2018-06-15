initialization
initializeWidgets
	super initializeWidgets.
	self initializeRemoteURL.
	self remoteInputText ghostText: 'e.g., ssh://[user@]host.xz[:port]/path/to/repo.git'.
	
	self remoteInputText 	whenTextChanged: [ :text | 
	self projectLocation appendPath: (self extractProjectName: text) ].
	
	self focusOrder 
		add: self remoteInputText	