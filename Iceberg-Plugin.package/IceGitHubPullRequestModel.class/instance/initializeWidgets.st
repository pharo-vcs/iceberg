initialization
initializeWidgets
	titleLabel := self newLabel.
	titlePanel := self newTextInput.
	headLabel := self newLabel.
	headPanel := self newDropList.
	baseLabel := self newLabel.
	basePanel := self newDropList.
	bodyLabel := self newLabel.
	bodyPanel := self newText.
	addButton := self newButton.
		
	titleLabel label: 'Title'.
	headLabel label: 'From (Head)'.
	baseLabel label: 'To (Base)'.
	bodyLabel label: 'Comment'.
	addButton label: 'Create pull request'.
	addButton action: [ self accept ].
	
	self focusOrder 
		add: titlePanel;
		add: headPanel;
		add: basePanel;
		add: bodyPanel;
		add: addButton