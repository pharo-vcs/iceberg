initialization
initializeWidgets

	super initializeWidgets.

	usernameLabel := self newLabel label: 'Username: '.
	usernameInput := self newTextInput 
		autoAccept: true;
		whenTextChanged: [ self updateOkButton ];
		yourself.
	
	passwordLabel := self newLabel label: 'Password: '.
	passwordInput := self newTextInput beEncrypted; 
			autoAccept: true;
			whenTextChanged: [ self updateOkButton ];
			yourself.
	
	self focusOrder
		add: usernameInput;
		add: passwordInput;
		add: storeCheckbox
