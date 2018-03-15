initialization
initializeWidgets
	currentBranchLabel := self newLabel label: ('Current branch: ', self model branchName).
	branchLabel := self newLabel label: 'New branch'.
	branchInputText := self newTextInput 
		autoAccept: true;
		ghostText: 'a-branch-name'.
		
	spacePanel := PanelMorph new asSpecAdapter. 