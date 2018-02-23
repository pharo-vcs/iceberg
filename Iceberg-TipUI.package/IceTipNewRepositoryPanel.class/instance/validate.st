accessing
validate 
	self 
		assert: self projectNameInputText text isNotEmpty  
		description: 'You must enter a project name (it will be used also as part of the path).'.
	self
		assert: self projectLocation location notNil  
		description: 'Project location must be defined (if it does not exists, it will be created).'