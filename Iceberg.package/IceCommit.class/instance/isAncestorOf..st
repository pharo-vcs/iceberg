ancestry
isAncestorOf: aCommit
	
	^ aCommit newCommitWalk includesCommit: self