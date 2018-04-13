tests-checkout
testCheckoutOlderCommitLeavesRepositoryInDetachedMode

	| message |
	message := 'Added IceGeneratedClassForTesting'.

	"This is a Ring working copy"
	repository workingCopy
		createClass: 'IceGeneratedClassForTesting' 
		inPackage: self packageName1 asSymbol.

	repository commitWithMessage: message.
	
	message := 'Added IceAnotherClass'.
	"This is a Ring working copy"
	repository workingCopy
		createClass: 'IceAnotherClass'
		inPackage: self packageName1 asSymbol.

	repository commitWithMessage: message.
	
	repository branch newCommitWalk commits second checkout.
	self assert: repository head isDetached