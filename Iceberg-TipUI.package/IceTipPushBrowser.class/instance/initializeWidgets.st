initialization
initializeWidgets
	super initializeWidgets.
	
	commitsPanel := self instantiate: IceTipCommitishHistoryBrowser on: self model.
	actionPanel := self instantiate: IceTipActionPanel.
	actionPanel addAction: (pushButton := self newButton 
		label: 'Push';
		icon: #up asIcon;
		help: ('Push your commits to {1}' format: { self model remoteName });
		action: [ self doPush ];
		yourself).
		
	"self whenBuiltDo: [ :ann | self addShortcutsTo: ann widget ]."
	
	self focusOrder 
		add: commitsPanel;
		add: actionPanel