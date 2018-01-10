tests
testAllBranches
	self assert: (
		(repository allBranches collect: #name)
			includesAll: { 
				'master'.
				'origin/forBecomeWriteable'.
				'origin/master'.
				'origin/reference'
			}) 
