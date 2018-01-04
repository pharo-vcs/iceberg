tests-checkout
testCheckoutOlderCommitLeavesRepositoryInDetachedMode

	| message |
	message := 'Added IceGeneratedClassForTesting'.

	"This is a Ring working copy"
	repository workingCopy
		createClass: 'IceGeneratedClassForTesting' 
		inPackage: packageName asSymbol.

	repository commitWithMessage: message.
	
	message := 'Added IceAnotherClass'.
	"This is a Ring working copy"
	repository workingCopy
		createClass: 'IceAnotherClass'
		inPackage: packageName asSymbol.

	repository commitWithMessage: message.
	
	repository branch newCommitWalk commits second checkout.
	self assert: repository isDetached