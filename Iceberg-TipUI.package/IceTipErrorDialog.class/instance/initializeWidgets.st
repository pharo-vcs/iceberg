initialization
initializeWidgets
	iconPanel := self newIcePanel.
	iconPanel widget addMorph: ((self iconNamed: #error) scaledToSize: 32@32) asMorph.
	
	errorLabel := self newLabel.
	errorLabel label: exception messageText.