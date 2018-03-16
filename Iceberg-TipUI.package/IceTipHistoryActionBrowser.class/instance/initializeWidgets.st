initialization
initializeWidgets
	super initializeWidgets.
	
	commitsPanel := self instantiate: IceTipCommitishHistoryBrowser on: self model.
	actionPanel := self instantiate: IceTipActionPanel.
	actionPanel addAction: (button := self newActionButton).
	
	self whenBuiltDo: [ :ann | self addShortcutsTo: ann widget ]