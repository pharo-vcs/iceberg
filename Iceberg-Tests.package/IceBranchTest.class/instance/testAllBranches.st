tests
testAllBranches
	self assert: (
		(repository backend allBranches collect: #name)
			includesAll: { 
				'master'.
				'origin/forBecomeWriteable'.
				'origin/master'.
				'origin/reference'
			}) 
