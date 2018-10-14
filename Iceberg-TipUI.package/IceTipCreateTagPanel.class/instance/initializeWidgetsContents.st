initialization
initializeWidgetsContents
	self initializeCurrentBranchLabel.
	tagNameLabel := self newLabel label: 'New tag'.
	tagNameInputText := self newTextInput
		autoAccept: true;
		ghostText: 'e.g., v[X].[Y].[Z]'.
	self initializeNextTagPanel.
	self initializeExistingTagsList.
	spacePanel := PanelMorph new asSpecAdapter