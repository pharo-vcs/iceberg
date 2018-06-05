initialization
initializeWidgets

	pushCheckbox := self newCheckBox.
	self repositoryModel branchModel hasUpstream
		ifTrue: [ pushCheckbox label: ('Push changes to {1}' format: { self repositoryRemoteName }) ]
		ifFalse: [ pushCheckbox
				label: ('Cannot push new branch automatically. Use the `Push` option');
				enabled: false ].

	commentText := self newText
		autoAccept: true;
		whenBuiltDo: [ :ann |  ann widget withGhostText: 'A comment for your commit' ].
	actionPanel := self newIceActionPanel.
	actionPanel addAction: (commitButton := self newButton 
		label: 'Commit';
		icon: (self iconNamed: #smallOk);
		help: ('Commit your changes to {1}' format: { self repositoryName });
		yourself).
		
	self focusOrder
		add: commentText;
		add: commitButton;
		add: pushCheckbox