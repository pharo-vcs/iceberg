initialization
initializeWidgets
	nameLabel := self newLabel label: 'Remote name'.
	nameText := self newTextInput
		placeholder: 'e.g., user-remote';
		autoAccept: true.
	urlLabel := self newLabel label: 'Remote URL'.
	urlText := self newTextInput
		placeholder: 'e.g., git@github.com:user/project.git';
		autoAccept: true.
	self focusOrder
		add: nameText;
		add: urlText