as yet unclassified
initialize
	super initialize.
	self 
		bindKeyCombination: PharoShortcuts current copySelectionShortcut 
		toAction: [ :target | target editor copySelection ]	