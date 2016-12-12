tests
testBranches
	self assert: (
		repository backend localBranchNames 
			includesAll: { 'master' }) 
