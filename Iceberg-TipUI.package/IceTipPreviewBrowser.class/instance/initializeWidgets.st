initialization
initializeWidgets
	super initializeWidgets.
	
	diffPanel := self instantiate: IceTipDiffPanel on: self model diff.
	actionPanel := self newIceActionPanel.
	actionPanel addAction: (button := self newActionButton).
	
	self whenBuiltDo: [ :ann | self addShortcutsTo: ann widget ].
	
	self focusOrder 
		add: self actionPanel;
		add: self diffPanel