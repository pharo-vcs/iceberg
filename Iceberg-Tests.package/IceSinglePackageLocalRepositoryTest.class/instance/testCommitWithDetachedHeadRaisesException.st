tests-commit
testCommitWithDetachedHeadRaisesException

	| message |
	repository branch commit checkout.
	self assert: repository isDetached.
	
	message := 'Added IceGeneratedClassForTesting'.
	"This is a Ring working copy"
	repository workingCopy
		createClass: 'IceGeneratedClassForTesting' 
		inPackage: packageName asSymbol.
			
	self should: [repository commitWithMessage: message] raise: IceWorkingCopyDesyncronized.