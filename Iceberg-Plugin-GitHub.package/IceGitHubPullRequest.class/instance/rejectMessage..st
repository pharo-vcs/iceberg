actions
rejectMessage: messageString
	messageString trimBoth 
		ifNotEmpty: [ self addComment: messageString ].
	IceGitHubAPI new 
		updatePullRequest: self owner 
			project: self projectName
			number: self number
			data: { #state -> #closed } asDictionary