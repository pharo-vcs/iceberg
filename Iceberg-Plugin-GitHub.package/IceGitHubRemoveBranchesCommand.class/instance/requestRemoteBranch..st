private
requestRemoteBranch: aName
	^ IceGitHubAPI new
		getBranch: self remote owner 
		project: self remote projectBasename
		name: aName