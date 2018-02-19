private
refresh
	commitList widget 
		in: [ :this | this dataSource elements: self commits ];
		refresh.
	selectedModel := self commits first.
	self refreshCommitPanel