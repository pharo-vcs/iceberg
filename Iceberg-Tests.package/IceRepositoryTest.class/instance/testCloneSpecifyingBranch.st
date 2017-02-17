tests - create repository
testCloneSpecifyingBranch
	repository checkoutBranch: 'forBecomeWriteable'.

	self assert: repository branchName equals: 'forBecomeWriteable'.
	self assert: repository branch name equals: 'forBecomeWriteable'.
	self assert: repository backend branch name equals: 'forBecomeWriteable'.
	self assert: repository backend currentBranch equals: 'forBecomeWriteable'.	
		
	repository loadPackage: packageName.
	self assert: ((Smalltalk at: #Test) canUnderstand: #forBecomeWritable)

