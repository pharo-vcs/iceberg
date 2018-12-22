accessing
validate
	
	self
		assert: ((issueNumberText text asString notEmpty) and: [ issueNumberText text isAllDigits ])
		description: 'Please enter a valid issue number'.
		
	self
		assert: fetched
		description: 'Please fetch a valid issue number'