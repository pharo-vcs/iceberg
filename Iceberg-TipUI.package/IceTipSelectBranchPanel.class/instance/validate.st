accessing
validate
	self 
		assert: self branchSelected isNotNil 
		description: 'Please select a branch to checkout.'