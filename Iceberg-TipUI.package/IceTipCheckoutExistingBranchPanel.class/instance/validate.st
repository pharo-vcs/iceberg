accessing
validate
	self 
		assert: self selectedBranch isNotNil 
		description: 'Please select a branch to checkout.'