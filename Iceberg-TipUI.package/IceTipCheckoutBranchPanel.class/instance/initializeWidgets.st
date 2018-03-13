initialization
initializeWidgets
	branchesList := self newTreeTable.
	branchNameText := self newTextInput 
		autoAccept: true;
		ghostText: 'Branch...'.
	
	self initializeBranchesList.
	self initializeBranchNameText.
	
	self focusOrder 
		add: self branchesList;
		add: self branchNameText