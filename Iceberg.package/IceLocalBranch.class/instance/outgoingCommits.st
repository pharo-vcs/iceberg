API-remotes
outgoingCommits
	
	self hasUpstream ifFalse: [ ^ #() ].
	^ self outgoingCommitsTo: self upstream remote