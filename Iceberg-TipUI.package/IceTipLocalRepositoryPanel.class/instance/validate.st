accessing
validate 
	self
		assert: self projectLocation location notNil  
		description: 'Project location must exist!'.
	
	self
		assert: self projectLocation location exists  
		description: 'Project location must exist!'.
		
	self 
		assert: (IceRepositoryCreator isGitRoot: self projectLocation location)
	 	description: 'Project location does not seems to be a valid git repository.'