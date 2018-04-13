tests-checkout
testCheckoutOlderCommitLeavesRepositoryInDetachedMode

	| message |
	message := 'Added IceGeneratedClassForTesting'.
	"This is a Ring working copy"
	repository workingCopy
		createClass: 'IceAnotherGeneratedClassForTesting' 
		inPackage: self packageName1 asSymbol.
	repository commitWithMessage: message.
	
	message := 'Added IceAnotherClass'.
	"This is a Ring working copy"
	repository workingCopy
		createClass: 'IceAnotherClass' 
		inPackage: self packageName1 asSymbol.
	repository commitWithMessage: message.
	
	repository branch newCommitWalk commits second checkoutAllPackages.
	self assert: repository head isDetached