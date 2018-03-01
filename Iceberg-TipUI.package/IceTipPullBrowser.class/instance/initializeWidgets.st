initialization
initializeWidgets
	super initializeWidgets.
	
	commitsPanel := self instantiate: IceTipCommitishHistoryBrowser on: self model.
	actionPanel := self instantiate: IceTipActionPanel.
	actionPanel addAction: (pushButton := self newButton 
		label: 'Pull';
		icon: #down asIcon;
		help: ('Pull new commits from {1}' format: { self model remoteName });
		action: [ self doPull ];
		yourself).
		
	"self whenBuiltDo: [ :ann | self addShortcutsTo: ann widget ]."
	
	self focusOrder 
		add: commitsPanel;
		add: actionPanel