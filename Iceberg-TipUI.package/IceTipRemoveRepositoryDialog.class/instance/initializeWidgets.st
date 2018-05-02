initialization
initializeWidgets
	iconPanel := self newIcePanel.
	iconPanel widget addMorph: #question asIcon asMorph.
	
	confirmLabel := self newLabel 
		label: (self class confirmMessage format: { self model name }).
	removeFileSystemCheckbox := self newCheckBox
		label: self class removeMessage.
		
	self focusOrder 
		add: self removeFileSystemCheckbox