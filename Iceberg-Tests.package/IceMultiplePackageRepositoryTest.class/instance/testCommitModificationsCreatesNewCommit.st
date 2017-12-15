tests-commit
testCommitModificationsCreatesNewCommit

	| message |
	message := 'Added IceGeneratedClassForTesting'.
	Object subclass: 'IceGeneratedClassForTesting'
		instanceVariableNames: ''
		classVariableNames: ''
		package: packageName1 asSymbol.
	repository commitWithMessage: message.
	
	self assert: repository branch commit comment equals:  message