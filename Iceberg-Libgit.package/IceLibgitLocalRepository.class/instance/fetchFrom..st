actions
fetchFrom: aRemote
	self withRepoDo: [ :repo | 
		[ (LGitRemote of: repo named: aRemote remoteName) 
			lookup; 
			fetchWithCredentials: IceCredentialsProvider default ]
		on: LGit_GIT_ERROR do: [ :e | self handleGitError: e ] ]