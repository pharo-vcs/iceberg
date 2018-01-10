tests - create repository
testCloneSpecifyingBranch
	repository checkoutBranch: 'forBecomeWriteable'.

	self assert: repository branchName equals: 'forBecomeWriteable'.
	self assert: repository branch name equals: 'forBecomeWriteable'.
		
	repository checkoutPackageNamed: packageName.
	self assert: ((Smalltalk at: #Test) canUnderstand: #forBecomeWritable)