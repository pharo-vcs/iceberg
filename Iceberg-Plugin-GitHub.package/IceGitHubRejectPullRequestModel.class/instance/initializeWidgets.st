initialization
initializeWidgets
	messageLabel := self newLabel.
	messageText := self newText autoAccept: true.
	acceptButton := self newButton.
		
	messageLabel label: 'Comment'.
	messageText 	whenBuiltDo: [ :this | this widget withGhostText: self class messageGhostText ].
	acceptButton label: 'Reject pull request'.
	acceptButton action: [ self accept ].
	
	self focusOrder 
		add: messageText;
		add: acceptButton