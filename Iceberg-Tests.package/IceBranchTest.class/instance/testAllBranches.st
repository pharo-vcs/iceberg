tests
testAllBranches
	self assert: (
		repository backend allBranchNames 
			includesAll: { 
				'master'.
				'origin/forBecomeWriteable'.
				'origin/master'.
				'origin/reference'
			}) 
