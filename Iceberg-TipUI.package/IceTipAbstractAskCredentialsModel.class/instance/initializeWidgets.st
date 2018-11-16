initialization
initializeWidgets
	
	storeCheckbox := self newCheckBox
		label: 'Do you want this credentials to be stored for future use?';
		help: 'Please note that storing your credentials is handy but unsafe';
		state: true.
	
	self whenWindowChanged: [ self updateOkButton ].
