actions
checkoutPackagesNamed: aCollection 
	
	"We can only checkout if we have a single reference commit.
	Otherwise, we are in a merge and we should resolve it."
	self assert: self referenceCommit size = 1.
	
	self
		checkoutPackagesNamed: aCollection
		fromCommit: self referenceCommit first