tests
testBranches
	self assert: (
		repository localBranchNames
			includesAll: { 'master' }) 
