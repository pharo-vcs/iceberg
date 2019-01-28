initialization
initializeDialogWindow: aWindow

	acceptButton := aWindow 
		addButton: 'Add' 
		do: [ :presenter | self accept. presenter close ].
	acceptButton disable