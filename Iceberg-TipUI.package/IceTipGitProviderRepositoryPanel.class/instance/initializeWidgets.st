initialization
initializeWidgets
	self initializeProjectLocation.
	self initializeSourceDirectory.
	self initializeSpacePanel.
	userNameLabel := self newLabel label: self providerName, ' username'.
	userNameInputText := self newTextInput
		autoAccept: true;
		ghostText: 'JohnDoe'.
	projectNameLabel := self newLabel label: self providerName, ' project'.
	projectNameInputText := self newTextInput
		autoAccept: true;
		ghostText: 'MyProject'.
	
	userNameInputText 	whenTextChanged: [ :text | 
		projectLocation appendPath: self projectAsPathToAppend ].
	projectNameInputText whenTextChanged: [ :text |
		projectLocation appendPath: self projectAsPathToAppend ].
	
	self focusOrder 
		add: self userNameInputText;
		add: self projectNameInputText;
		add: self projectLocation;
		add: self subdirectoryInputText