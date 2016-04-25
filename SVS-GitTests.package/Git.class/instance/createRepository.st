repository handling
createRepository
	^ MCFileTreeGitRemoteRepository 
		location: self origin 
		name: ''
		subdirectory: '' 
		branch: (self branch ifNil: '').
