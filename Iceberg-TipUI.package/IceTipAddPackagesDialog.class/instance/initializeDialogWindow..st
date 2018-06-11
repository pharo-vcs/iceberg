initialization
initializeDialogWindow: aWindow
	super initializeDialogWindow: aWindow.
	acceptButton
		disable;
		label: 'Add'