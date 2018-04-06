operations
fetchFrom: aRemote
	self halt.
	(LGitRemote of: self repositoryHandle named: self remoteName)
		lookup;
		fetchWithCredentials: IceCredentialsProvider default refSpec: (LGitRefSpec fromString: self name , ':' , self fullname)