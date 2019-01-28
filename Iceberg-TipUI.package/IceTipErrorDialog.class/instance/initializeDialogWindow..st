initialization
initializeDialogWindow: aWindow

	aWindow 
		addButton: 'Debug' 
		do: [ :presenter | self accept. presenter close ].
	aWindow 
		addButton: 'Ignore' 
		do: [ :presenter | presenter close ].