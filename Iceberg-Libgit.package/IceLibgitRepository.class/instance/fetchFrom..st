actions
fetchFrom: aRemote
	self withRepoDo: [ :repo | 
		(LGitRemote of: repo named: aRemote name) 
			lookup; 
			fetchWithCredentials: IceCredentialsProvider default ]