tests
testBranches
	self assert: (repository backend localBranches collect: #name as: Array)
		equals: { 'master' }
