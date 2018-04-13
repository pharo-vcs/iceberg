tests-commit
testCommitModificationsCreatesNewCommit

	| message |
	message := 'Added IceGeneratedClassForTesting'.
	"This is a Ring working copy"
	repository workingCopy
		createClass: 'IceAnotherGeneratedClassForTesting' 
		inPackage: self packageName1 asSymbol.
	repository commitWithMessage: message.
	
	self assert: repository branch commit comment equals:  message.
	self deny: repository workingCopy isDetached.