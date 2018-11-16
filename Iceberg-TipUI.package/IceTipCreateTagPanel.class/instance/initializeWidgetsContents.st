initialization
initializeWidgetsContents
	self initializeCurrentBranchLabel.
	tagNameLabel := self newLabel label: 'New tag'.
	tagNameInputText := self newTextInput
		autoAccept: true;
		ghostText: 'e.g., v[X].[Y].[Z]'.
	spacePanel := PanelMorph new asSpecAdapter