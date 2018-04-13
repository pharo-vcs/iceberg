tests-commit
testCommitModificationsDoNotCreateBranch

	| message |
	message := 'Added IceGeneratedClassForTesting'.
	"This is a Ring working copy"
	repository workingCopy
		createClass: 'IceGeneratedClassForTesting' 
		inPackage: self packageName1 asSymbol.
	repository commitWithMessage: message.
	
	self assert: repository allBranches size equals: 1.
	self deny: repository workingCopy isDetached.