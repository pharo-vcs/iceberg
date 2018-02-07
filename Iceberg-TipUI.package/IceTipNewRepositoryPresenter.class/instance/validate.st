accessing
validate 
	self 
		assert: self projectNameInputText text isNotEmpty  
		description: 'Project name is required.'.
		
	self
		assert: self projectLocation location notNil  
		description: 'Project location must exist.'