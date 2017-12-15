operations
fetchFrom: aRemote
self halt.
	repository withRepoDo: [ :libgitRepo | 
		(LGitRemote of: libgitRepo named: self remoteName) 
			lookup; 
			fetchWithCredentials: IceCredentialsProvider default refSpec: (LGitRefSpec fromString: self name, ':', self fullname) ]