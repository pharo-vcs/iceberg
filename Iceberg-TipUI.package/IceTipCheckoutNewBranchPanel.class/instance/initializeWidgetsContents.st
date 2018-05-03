initialization
initializeWidgetsContents
	self initializeCurrentBranchLabel.
	branchLabel := self newLabel label: 'New branch'.
	branchInputText := self newTextInput
		autoAccept: true;
		ghostText: 'e.g., feature/what'.
	spacePanel := PanelMorph new asSpecAdapter