initialization
initializeWidgets
	optionsList := self newTable.
	detailPanel := self newPanel.
	
	self initializeOptionsList.
	
	self focusOrder 
		add: self optionsList