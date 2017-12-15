tests-branch
testBranchAlreadyExistsErrorInformsExistingBranchName
	
	| branchName |
	branchName := 'master'.
	[ repository createBranch: branchName.
	  self fail ]
		on: IceBranchAlreadyExists
	 	do: [ :error | self assert: error branchName equals: branchName ]