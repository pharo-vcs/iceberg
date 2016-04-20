repository handling
createRepository
	^ MCFileTreeGitRemoteRepository 
		location: self origin 
		name: (self branch ifNil: '')
		subdirectory: '' 
		branch: ''.
