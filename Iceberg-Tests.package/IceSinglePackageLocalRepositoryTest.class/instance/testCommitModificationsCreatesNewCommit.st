tests-commit
testCommitModificationsCreatesNewCommit

	| message |
	message := 'Added IceGeneratedClassForTesting'.
	Object subclass: 'IceGeneratedClassForTesting'
		instanceVariableNames: ''
		classVariableNames: ''
		package: packageName asSymbol.
	repository commitWithMessage: message.
	
	self assert: repository branch commit comment equals:  message