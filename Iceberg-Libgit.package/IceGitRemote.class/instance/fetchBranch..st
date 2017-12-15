fetching
fetchBranch: aBranch
	localRepository withRepoDo: [ :libgitRepo | 
		(LGitRemote of: libgitRepo named: self name)
			lookup; 
			fetchWithCredentials: IceCredentialsProvider default refSpec: (LGitRefSpec fromString: aBranch name, ':refs/remotes/', self name, '/', aBranch name) ]