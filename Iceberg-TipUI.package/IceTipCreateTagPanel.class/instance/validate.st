accessing
validate
	self 
		assert: self tagName isNotEmpty
		description: 'Please enter your new branch name.'.
	self 
		assert: (self tagName noneSatisfy: #isSeparator)
		description: 'You can''t have spaces in your branch name.'