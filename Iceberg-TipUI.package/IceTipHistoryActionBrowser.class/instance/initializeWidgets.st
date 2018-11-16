initialization
initializeWidgets
	super initializeWidgets.
	
	commitsPanel := self instantiate: IceTipHistoryBrowser on: self model.
	actionPanel := self newIceActionPanel.
	actionPanel addAction: (button := self newActionButton).
	
	self whenBuiltDo: [ :ann | self addShortcutsTo: ann widget ]