accessing
initializeDialogWindow: aWindow
	
	aWindow 
		addButton: 'Accept' 
		do: [ :presenter | self accept. presenter close ] 