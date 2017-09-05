asserting
assertParse: aString rule: rule equals: result 
	self 
		assert: (self parse: aString rule: rule)
		equals: result