initialization
initializeWidgets
	reasonPanel := self newPanel.
	optionsList := self newTable.
	detailPanel := self newPanel.
	
	self initializeReasonPanel.
	self initializeOptionsList.
	
	self focusOrder 
		add: self optionsList