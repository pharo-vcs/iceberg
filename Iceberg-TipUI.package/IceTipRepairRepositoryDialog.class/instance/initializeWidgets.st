initialization
initializeWidgets
	reasonPanel := self newIcePanel.
	optionsList := self newIceTable.
	detailPanel := self newIcePanel.
	
	self initializeReasonPanel.
	self initializeOptionsList.
	
	self focusOrder 
		add: self optionsList