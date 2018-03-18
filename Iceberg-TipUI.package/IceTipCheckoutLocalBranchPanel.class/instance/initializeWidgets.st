initialization
initializeWidgets
	branchesList := self newTable.
	self initializeBranchesList.
	
	self focusOrder 
		add: self branchesList