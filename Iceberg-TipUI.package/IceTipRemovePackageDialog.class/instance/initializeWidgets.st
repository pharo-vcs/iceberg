initialization
initializeWidgets
	iconPanel := self newIcePanel.
	iconPanel widget addMorph: #question asIcon asMorph.
	
	confirmLabel := self newLabel 
		label: (self class confirmMessage format: { self model name }).
	unloadFromImageCheckbox := self newCheckBox
		label: 'Unload from image';
		state: true.
	removeFromRepositoryCheckbox := self newCheckBox
		label: 'Remove from repository';
		state: true.

	self focusOrder 
		add: unloadFromImageCheckbox;
		add: removeFromRepositoryCheckbox