initialization
initializeWidgets
	pushCheckbox := self newCheckBox. 
	commentText := self newText
		autoAccept: true;
		whenBuiltDo: [ :ann | ann widget withGhostText: 'A comment for your commit' ].
	actionPanel := self instantiate: IceTipActionPanel.
	actionPanel addAction: (commitButton := self newButton 
		label: 'Commit';
		"icon: #smallOk asIcon;"
		yourself)