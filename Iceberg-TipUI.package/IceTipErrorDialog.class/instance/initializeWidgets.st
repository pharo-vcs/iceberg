initialization
initializeWidgets
	iconPanel := self newIcePanel.
	iconPanel widget addMorph: ((self iconNamed: #error) scaledToSize: 32@32) asMorph.
	
	errorLabel := self newIceReadOnlyText.
	errorLabel widget contentsWrapped: exception messageText.
	errorLabel widget
		hResizing: #spaceFill;
		vResizing: #spaceFill.