actions
addComment: messageString
	IceGitHubAPI new 
		addComment: self owner 
			project: self projectName
			number: self number
			data: { #body -> messageString } asDictionary