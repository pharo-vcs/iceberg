tests-checkout
testCheckoutOlderCommitLeavesRepositoryInDetachedMode

	| message |
	message := 'Added IceGeneratedClassForTesting'.
	"This is a Ring working copy"
	repository workingCopy
		createClass: 'IceAnotherGeneratedClassForTesting' 
		inPackage: packageName1 asSymbol.
	repository commitWithMessage: message.
	
	message := 'Added IceAnotherClass'.
	"This is a Ring working copy"
	repository workingCopy
		createClass: 'IceAnotherClass' 
		inPackage: packageName1 asSymbol.
	repository commitWithMessage: message.
	
	repository branch newCommitWalk commits second checkout.
	self assert: repository head isDetached