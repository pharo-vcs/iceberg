tests-commit
testCommitModificationsDoesNotCreateBranch

	| message |
	message := 'Added IceGeneratedClassForTesting'.
	Object subclass: 'IceGeneratedClassForTesting'
		instanceVariableNames: ''
		classVariableNames: ''
		package: packageName1 asSymbol.
	repository commitWithMessage: message.
	
	self assert: repository allBranches size equals: 1