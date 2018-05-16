initialization
initializeWidgets
	message := self newText
		autoAccept: true;
		whenBuiltDo: [ :this | this widget withGhostText: self class messageGhostText ];
		whenTextChanged: [ | enable |
			enable := self messageText notEmpty.
			commitButton enabled: enable.
			commitPushButton enabled: enable ];
		yourself.
	commitButton := self newButton
		label: 'Commit';
		enabled: false;
		yourself.
	commitPushButton := self newButton
		label: 'Commit and push';
		enabled: false;
		yourself.
		
	self focusOrder 
		add: message;
		add: commitButton;
		add: commitPushButton