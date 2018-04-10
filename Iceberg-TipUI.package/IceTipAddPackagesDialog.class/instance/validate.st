accessing
validate
	self 
		assert: self selectedPackage isNotNil 
		description: 'Please select a branch to checkout.'