accessing
validate
	self 
		assert: self branchName isNotEmpty
		description: 'Please enter your new branch name.'.
	self 
		assert: (self branchName noneSatisfy: #isSeparator)
		description: 'You can''t have spaces in your branch name.'