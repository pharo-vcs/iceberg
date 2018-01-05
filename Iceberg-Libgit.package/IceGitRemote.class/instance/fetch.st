fetching
fetch

	localRepository withRepoDo: [ :repo | 
		(LGitRemote of: repo named: self name)
			lookup; 
			fetchWithCredentials: IceCredentialsProvider default ]