tests-branch
testBranchWithSlashesNotFoundErrorInformsNotFoundBranchName

	| branchName |
	branchName := 'feature/nonexisting'.
	[ self repository switchToBranchNamed: branchName.
	  self fail ]
		on: IceBranchNotFound
	 	do: [ :error | self assert: error branchName equals: branchName ]