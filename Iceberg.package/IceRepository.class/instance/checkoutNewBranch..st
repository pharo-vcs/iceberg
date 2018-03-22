API-branches
checkoutNewBranch: aString
	"Creates and checks out a new branch"
	self flag: #todo. "We need a better name for this method (or a better place to put it)"
	self 
		createBranch: aString 
		inCommit: self workingCopy referenceCommit