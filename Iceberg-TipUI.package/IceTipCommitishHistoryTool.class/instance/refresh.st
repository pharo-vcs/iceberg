private
refresh
	commitList widget 
		in: [ :this | this dataSource elements: self commits ];
		refresh.
	selectedCommit := self commits first.
	self refreshCommitPanel