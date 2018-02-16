accessing
validate
	self 
		assert: self userName isNotEmpty  
		description: 'You must enter a GitHub username.'.
	self 
		assert: self projectName isNotEmpty  
		description: 'You must enter a GitHub project.'.
	super validate