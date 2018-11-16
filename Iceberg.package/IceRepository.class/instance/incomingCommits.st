API-remotes
incomingCommits
	
	(self head isDetached)
		ifTrue: [ ^ #() ].
	^ self branch incomingCommits