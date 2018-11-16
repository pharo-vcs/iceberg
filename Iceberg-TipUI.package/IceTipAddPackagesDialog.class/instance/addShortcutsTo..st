initialization
addShortcutsTo: aWidget
	super addShortcutsTo: aWidget.
	aWidget 
		bindKeyCombination: Character cr asKeyCombination 
		toAction: [ self accept ].
	