tests-checkout
testCheckoutOlderCommitLeavesRepositoryInDetachedMode

	| message |
	message := 'Added IceGeneratedClassForTesting'.
	Object subclass: 'IceGeneratedClassForTesting'
		instanceVariableNames: ''
		classVariableNames: ''
		package: packageName1 asSymbol.
	repository commitWithMessage: message.
	
	message := 'Added IceAnotherClass'.
	Object subclass: 'IceAnotherClass'
		instanceVariableNames: ''
		classVariableNames: ''
		package: packageName1 asSymbol.
	repository commitWithMessage: message.
	
	repository branch newCommitWalk commits second checkout.
	self assert: repository isDetached