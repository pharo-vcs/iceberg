tests-branch
testBranchAlreadyExistsErrorInformsExistingBranchName
	
	| branchName |
	self repository head isUnbornBranch ifTrue: [ ^ self skip ].
	
	branchName := 'master'.
	[ self repository createBranch: branchName.
	  self fail ]
		on: IceBranchAlreadyExists
	 	do: [ :error | self assert: error branchName equals: branchName ]