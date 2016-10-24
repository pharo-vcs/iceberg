tests - create repository
testCloneSpecifyingBranch
	repository branchName: 'forBecomeWriteable'.
	repository createRepository.

	self assert: repository branchName equals: 'forBecomeWriteable'.
	self assert: repository branch name equals: 'forBecomeWriteable'.
	self assert: repository backend branch equals: 'forBecomeWriteable'.
	self assert: repository backend currentBranch equals: 'forBecomeWriteable'.	
		
	repository loadPackage: packageName.
	self assert: ((Smalltalk at: #Test) canUnderstand: #forBecomeWritable)

