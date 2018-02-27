initialization
initializeWidgets
	pushCheckbox := self newCheckBox
		label: ('Push changes to {1}' format: { self repositoryRemoteName }).
	commentText := self newText
		autoAccept: true;
		whenBuiltDo: [ :ann | ann widget withGhostText: 'A comment for your commit' ].
	actionPanel := self instantiate: IceTipActionPanel.
	actionPanel addAction: (commitButton := self newButton 
		label: 'Commit';
		"icon: #smallOk asIcon;"
		help: ('Commit your changes to {1}' format: { self repositoryName });
		yourself)