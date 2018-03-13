initialization
initializeWidgets
	branchesList := self newTreeTable.
	branchNameText := self newTextInput.
	
	self initializeBranchesList.
	
	self focusOrder 
		add: branchesList;
		add: branchNameText