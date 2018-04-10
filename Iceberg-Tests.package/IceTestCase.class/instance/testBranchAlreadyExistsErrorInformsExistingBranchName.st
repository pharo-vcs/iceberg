tests-branch
testBranchAlreadyExistsErrorInformsExistingBranchName
	
	| branchName |
	repository head isUnbornBranch ifTrue: [ ^ self skip ].
	
	branchName := 'master'.
	[ repository createBranch: branchName.
	  self fail ]
		on: IceBranchAlreadyExists
	 	do: [ :error | self assert: error branchName equals: branchName ]