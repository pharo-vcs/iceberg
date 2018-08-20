events
fetchIfNeeded: aRepository

	(aRepository lookupCommit: SystemVersion current commitHash) isUnknownCommit
		ifFalse: [ ^ self ].

	UIManager default
		informUser: 'Fetching incoming commits'
		during: [ aRepository remotes
				detect: [ :each | each projectName = 'pharo-project' ]
				ifFound: [ :each | each fetch ] ]