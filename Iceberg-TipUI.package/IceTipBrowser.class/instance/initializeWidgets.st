initialization
initializeWidgets
	toolbar := self newToolbar.
	self initializeToolbar.
	self whenBuiltDo: [ :ann | self addShortcutsTo: ann widget ]