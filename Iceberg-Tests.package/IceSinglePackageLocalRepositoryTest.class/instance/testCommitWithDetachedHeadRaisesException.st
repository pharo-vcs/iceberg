tests-commit
testCommitWithDetachedHeadRaisesException

	| message |
	repository branch commit checkout.
	self assert: repository isDetached.
	
	message := 'Added IceGeneratedClassForTesting'.
	Object subclass: 'IceGeneratedClassForTesting'
		instanceVariableNames: ''
		classVariableNames: ''
		package: packageName asSymbol.
	
	self should: [repository commitWithMessage: message] raise: IceWorkingCopyDesyncronized.