merging
mergeCommit: aCommit 
	
	| merger |
	merger := MCThreeWayMerger
			base: self workingCopy mcSnapshot
			target: aCommit mcSnapshot
			ancestor: MCSnapshot empty.
	
	self executeMergeOfCommit: aCommit withMerger: merger.
	self workingCopy adoptCommit: aCommit.
	^ aCommit