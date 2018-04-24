initialization
initializeWidgets
	projectNameLabel := self newLabel label: 'Project name'.
	projectNameInput := self newTextInput 
		ghostText: 'e.g., project'; 
		autoAccept: true.
	self focusOrder add: projectNameInput.
	super initializeWidgets