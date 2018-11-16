tests-checkout
testCheckoutOlderCommitLeavesRepositoryInDetachedMode

	| message |
	message := 'Added IceGeneratedClassForTesting'.

	"This is a Ring working copy"
	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting' 
		inPackage: self packageName1 asSymbol.

	self repository commitWithMessage: message.
	
	message := 'Added IceAnotherClass'.
	"This is a Ring working copy"
	self repository workingCopy
		createClass: 'IceAnotherClass'
		inPackage: self packageName1 asSymbol.

	self repository commitWithMessage: message.
	
	self repository branch newCommitWalk commits second checkout.
	self assert: self repository head isDetached