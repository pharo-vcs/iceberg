initialization
initializeWidgets
	self initializeToolbar.
	self whenBuiltDo: [ :ann | self addShortcutsTo: ann widget ]