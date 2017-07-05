initialization
initializeWidgets
	messageLabel := self newLabel.
	messageText := self newText autoAccept: true.
	typeLabel := self newLabel.
	typeList := self newDropList.
	acceptButton := self newButton.
		
	messageLabel label: 'Comment'.
	messageText 	whenBuiltDo: [ :this | this widget withGhostText: self class messageGhostText ].
	typeLabel label: 'Merge type'.
	acceptButton label: 'Accept pull request'.
	acceptButton action: [ self accept ].
	
	self focusOrder 
		add: messageText;
		add: typeList;
		add: acceptButton