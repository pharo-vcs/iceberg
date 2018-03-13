initialization
initializeWidgets
	branchesList := self newTreeTable.
	branchNameText := self newTextInput autoAccept: true.
	
	self initializeBranchesList.
	
	self focusOrder 
		add: branchesList;
		add: branchNameText