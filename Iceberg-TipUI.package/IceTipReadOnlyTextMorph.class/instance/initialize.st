initialization
initialize
	super initialize.
	self 
		bindKeyCombination: PharoShortcuts current copySelectionShortcut 
		toAction: [ :target | target editor copySelection ].
	self 
		bindKeyCombination: PharoShortcuts current selectAllShortcut
		toAction: [ :target | target handleEdit: [ target selectAll ] ]