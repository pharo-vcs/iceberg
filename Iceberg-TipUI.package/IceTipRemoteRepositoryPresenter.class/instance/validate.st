accessing
validate
	| remoteString |
	
	remoteString := self remoteUrl.
	self 
		assert: remoteString isNotEmpty  
		description: 'You must enter your project url.'.
	self 
		assert: (IceGitRemote isValidUrl: remoteString)
		description: 'The url is incorrect.'.
		
	self
		assert: self projectLocation location notNil  
		description: 'Project location must be defined (if it does not exists, it will be created).'