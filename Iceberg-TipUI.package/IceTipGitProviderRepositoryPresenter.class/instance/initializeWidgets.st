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
	
	self focusOrder 
		add: self userNameInputText;
		add: self projectNameInputText;
		add: self projectLocation;
		add: self subdirectoryInputText