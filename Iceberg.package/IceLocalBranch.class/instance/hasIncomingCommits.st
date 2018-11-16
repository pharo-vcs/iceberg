testing
hasIncomingCommits
	
	self hasUpstream ifFalse: [ ^ false ].
	^ self hasIncomingCommitsFrom: self upstream remote