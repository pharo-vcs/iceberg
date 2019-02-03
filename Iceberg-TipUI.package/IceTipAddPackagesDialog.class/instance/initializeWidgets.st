initialization
initializeWidgets

	packagesList := self newIceTreeTable.
	packageNameText := self newTextInput
		autoAccept: true;
		placeholder: 'e.g., Collections'.
	self initializePackagesList.
	self initializePackageNameText.

	self focusOrder
		add: self packagesList;
		add: self packageNameText