tests-branch
testBranchNotFoundErrorInformsNotFoundBranchName

	| branchName |
	branchName := 'nonexisting'.
	[ self repository switchToBranchNamed: branchName.
	  self fail ]
		on: IceBranchNotFound
	 	do: [ :error | self assert: error branchName equals: branchName ]