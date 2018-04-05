API-remotes
incomingCommits
	
	self hasUpstream ifFalse: [ ^ #() ].
	^ self incomingCommitsFrom: self upstream remote