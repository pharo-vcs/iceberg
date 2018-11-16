tests-commit
testCommitModificationsDoNotCreateBranch

	| message |
	message := 'Added IceGeneratedClassForTesting'.
	
	"This is a Ring working copy"
	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting' 
		inPackage: self packageName1 asSymbol.

	self repository commitWithMessage: message.
	
	self assert: self repository allBranches size equals: 1.
	self deny: self repository workingCopy isDetached.