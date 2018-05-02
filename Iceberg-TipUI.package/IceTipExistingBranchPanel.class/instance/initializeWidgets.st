initialization
initializeWidgets
	branchesList := self newIceTable.
	self initializeBranchesList.
	
	self focusOrder 
		add: self branchesList