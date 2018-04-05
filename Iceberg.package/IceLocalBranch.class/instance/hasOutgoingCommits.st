testing
hasOutgoingCommits
	
	self hasUpstream ifFalse: [ ^ false ].
	^ self hasOutgoingCommitsTo: self upstream remote