accessing
validate 
	self
		assert: self location notNil  
		description: 'Project location must exist!'.
	
	self
		assert: self location exists  
		description: 'Project location must exist!'.
		
	self 
		assert: (IceRepositoryCreator isGitRoot: self location)
	 	description: 'Project location does not seems to be a valid git repository.'