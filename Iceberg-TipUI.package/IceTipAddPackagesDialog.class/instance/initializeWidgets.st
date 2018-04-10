initialization
initializeWidgets
	packagesList := self newTreeTable.
	packageNameText := self newTextInput 
		autoAccept: true;
		ghostText: 'Package...'.
	
	self initializePackagesList.
	self initializePackageNameText.
	
	self focusOrder 
		add: self packagesList;
		add: self packageNameText