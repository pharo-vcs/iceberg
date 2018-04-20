initialization
initializeWidgets
	super initializeWidgets.
	"self initializeRemoteURL."
	
	projectNameLabel := self newLabel label: 'Project name'.
	projectNameInputText := self newTextInput 
		ghostText: 'MyProject';
		autoAccept: true.
	
	projectNameInputText 	whenTextChanged: [ :text | 
		projectLocation appendPath: text ].
	
	self focusOrder 
		add: self projectNameInputText;
		add: self projectLocation;
		add: self subdirectoryInputText;
		add: self remoteInputText