initialization
initializeWidgets
	self initializeProjectLocation.
	self initializeSourceDirectory.
	self initializeSpacePanel.
	userNameLabel := self newLabel label: 'GitHub username'.
	userNameInputText := self newTextInput
		autoAccept: true;
		ghostText: 'JohnDoe'.
	projectNameLabel := self newLabel label: 'GitHub project'.
	projectNameInputText := self newTextInput
		autoAccept: true;
		ghostText: 'MyProject'.
	
	self focusOrder 
		add: self userNameInputText;
		add: self projectNameInputText;
		add: self subdirectoryInputText		