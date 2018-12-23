tests-checkout
testLocalCheckedOutBranchIsEqualsToHEAD

	"We commit to force the creation of the local branch"
	self repository workingCopy addPackageNamed: self packageName1.
	self repository commitWithMessage: 'Initial commit'.

	self assert: (self repository branchNamed: self repository head name) equals: self repository head.