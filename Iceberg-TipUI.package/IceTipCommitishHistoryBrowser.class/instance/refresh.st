private
refresh
	commitList widget 
		in: [ :this | this dataSource elements: self commits ];
		refresh.
	selectedModel := self commits 
		ifNotEmpty: #first
		ifEmpty: [ nil ].
	self refreshCommitTabPanel.