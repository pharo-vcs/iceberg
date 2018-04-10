initialization
initializeWidgets
	message := self newText
		autoAccept: true;
		whenBuiltDo: [ :this | this widget withGhostText: self class messageGhostText ];
		whenTextChanged: [ | enable |
			enable := self messageText notEmpty.
			commitButton enabled: enable ];
		yourself.
	commitButton := self newButton
		label: 'Commit';
		enabled: false;
		yourself.

	self focusOrder 
		add: message;
		add: commitButton