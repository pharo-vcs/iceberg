accessing
refresh
	commitList widget 
		in: [ :this | this dataSource elements: self model commitModels ];
		refresh.
	selectedModel := self model commitModels 
		ifNotEmpty: #first
		ifEmpty: [ nil ].
	self refreshCommitTabPanel