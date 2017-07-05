private
requestRemoteBranches
	^ IceGitHubAPI new
		getBranches: self remote owner 
		project: self remote projectBasename