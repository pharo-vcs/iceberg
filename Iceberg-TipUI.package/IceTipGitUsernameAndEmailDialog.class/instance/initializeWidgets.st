initialization
initializeWidgets
	nameLabel := self newLabel label: 'user.name'.
	nameInput := self newTextInput 
		ghostText: 'e.g., John Doe';
		autoAccept: true.
	emailLabel := self newLabel label: 'user.email'.
	emailInput := self newTextInput 
		ghostText: 'e.g., johndoe@mail.net';		
		autoAccept: true.
	globalCheckbox := self newCheckBox
		label: 'Save properties as global?';
		state: false.			
	self focusOrder
		add: nameInput;
		add: emailInput;
		add: globalCheckbox