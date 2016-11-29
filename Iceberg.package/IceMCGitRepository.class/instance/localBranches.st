querying
localBranches
	^ (self command: 'branch') lines 
		reject: [ :line | line matchesRegex: '\* \(detached from (.*)\)' ]
		thenCollect: [ :line | line allButFirst: 2 ]
