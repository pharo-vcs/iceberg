initialization
initializeWidgets
	toolbar := self instantiate: IceTipToolbar.
	self initializeToolbar.
	self whenBuiltDo: [ :ann | self addShortcutsTo: ann widget ]