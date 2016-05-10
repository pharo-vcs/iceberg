initialization
initializeWidgets
	message := self newText.
	commitButton := self newButton 
		label: 'Commit';
		yourself.
	
	self focusOrder 
		add: message.