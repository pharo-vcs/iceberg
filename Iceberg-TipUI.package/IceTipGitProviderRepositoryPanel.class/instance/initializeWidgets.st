initialization
initializeWidgets
	self initializeProjectLocation.
	self initializeSpacePanel.
	userNameLabel := self newLabel label: 'Owner name'.
	userNameInputText := self newTextInput
		autoAccept: true;
		ghostText: 'e.g., JohnDoe'.
	projectNameLabel := self newLabel label: 'Project name'.
	projectNameInputText := self newTextInput
		autoAccept: true;
		ghostText: 'e.g., MyProject'.

	protocolLabel := self newLabel label: 'Protocol'.
	protocolDropList := self newDropList.
	
	userNameInputText 	whenTextChanged: [ :text | 
		projectLocation appendPath: self projectAsPathToAppend ].
	projectNameInputText whenTextChanged: [ :text |
		projectLocation appendPath: self projectAsPathToAppend ].

	protocolDropList
		items: IceUrlProtocol allSubclasses;
		displayBlock: [ :each | each description ];
		setSelectedItem: IceUrlProtocol defaultProtocol.
	
	self focusOrder 
		add: self userNameInputText;
		add: self projectNameInputText;
		add: self projectLocation;
		add: self protocolDropList