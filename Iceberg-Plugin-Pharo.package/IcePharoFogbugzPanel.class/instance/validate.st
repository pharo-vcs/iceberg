accessing
validate
	
	self
		assert: ((issueNumberText text size >= 5) and: [ issueNumberText text isAllDigits ])
		description: 'Please enter a valid issue number'.
		
	self
		assert: fetched
		description: 'Please fetch a valid issue number'