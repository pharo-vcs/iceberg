API-remotes
incomingCommits
	
	(self head isDetached or: [ self pullRemote isNil ])
		ifTrue: [ ^ #() ].
	^ self incomingCommitsFrom: self pullRemote