tests-commit
testCommitModificationsCreatesNewCommit

	| message |
	message := 'Added IceGeneratedClassForTesting'.
	
	"This is a Ring working copy"
	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting' 
		inPackage: self packageName1 asSymbol.

	self repository commitWithMessage: message.
	
	self assert: self repository branch commit comment equals: message.
	self deny: self repository workingCopy isDetached.