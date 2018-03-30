actions
validate
	self 
		assert: self remoteName notEmpty 
		description: 'You need to specify a remote name.'.
	self 
		assert: self remoteUrl notEmpty
		description: 'You need to specify a remote url.'