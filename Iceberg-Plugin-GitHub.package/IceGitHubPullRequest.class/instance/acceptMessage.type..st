actions
acceptMessage: messageString type: typeString
	IceGitHubAPI new 
		putAcceptPullRequest: self owner 
			project: self projectName
			number: self number
			data: { 
				#commit_title -> (messageString lines 
					ifNotEmpty: [ :each | each first trimBoth ] 
					ifEmpty: [ '' ]). 
				#commit_message -> (messageString lines 
					ifNotEmpty: [ :lines | (lines allButFirst joinUsing: String lf) trimBoth ] 
					ifEmpty: [ '' ]). 
				#sha-> self branch lastCommit commitId.
				#merge_method -> typeString } asDictionary