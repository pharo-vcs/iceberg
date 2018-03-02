accessing
refresh
	commitList widget 
		in: [ :this | this dataSource elements: self model commits ];
		refresh.
	selectedModel := self model commits 
		ifNotEmpty: #first
		ifEmpty: [ nil ].
	self refreshCommitTabPanel.