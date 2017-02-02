actions
send
	| pullRequestData |

	pullRequestData := { 
		'title' -> self title.
		'head' -> (self headRemote owner, ':', self headBranchName).
		'base' -> self baseBranchName.
		'body' -> self body.
	} asDictionary.
	
	IceGitHubAPI new 
		credentials: self credentials;
		postPullRequestTo: self baseRemote owner 
			project: self baseRemote projectName 
			data: pullRequestData
	