tests-commit
testCommitModificationsDoesNotCreateBranch

	| message |
	message := 'Added IceGeneratedClassForTesting'.
	Object subclass: 'IceGeneratedClassForTesting'
		instanceVariableNames: ''
		classVariableNames: ''
		package: packageName asSymbol.
	repository commitWithMessage: message.
	
	self assert: repository allBranches size equals: 1