tests-checkout
testCheckoutOlderCommitLeavesRepositoryInDetachedMode

	| message |
	message := 'Added IceGeneratedClassForTesting'.
	"This is a Ring working copy"
	self  repository workingCopy
		createClass: 'IceAnotherGeneratedClassForTesting' 
		inPackage: self packageName1 asSymbol.
	self  repository commitWithMessage: message.
	
	message := 'Added IceAnotherClass'.
	"This is a Ring working copy"
	self  repository workingCopy
		createClass: 'IceAnotherClass' 
		inPackage: self packageName1 asSymbol.
	self  repository commitWithMessage: message.
	
	self  repository branch newCommitWalk commits second checkoutAllPackages.
	self assert: self  repository head isDetached