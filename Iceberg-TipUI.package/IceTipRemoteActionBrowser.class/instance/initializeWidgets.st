initialization
initializeWidgets
	super initializeWidgets.
	
	remoteLabel := self newLabel label: 'Remote:'.
	remoteList := self newDropList.
	remoteList
		items: self model remotes;
		displayBlock: [ :each | each descriptionText ].
	
	commitsPanel := self instantiate: IceTipCommitishHistoryBrowser on: self model.
	actionPanel := self instantiate: IceTipActionPanel.
	actionPanel addAction: (button := self newActionButton).
	
	remoteList whenSelectedItemChanged: [ :remoteModel | 
		self moveToRemote: remoteModel  ].
		
	self whenBuiltDo: [ :ann | self addShortcutsTo: ann widget ].
	
	self focusOrder 
		add: remoteList;
		add: commitsPanel;
		add: actionPanel