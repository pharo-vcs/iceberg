tests-commit
testCommitWithDetachedHeadRaisesException

	| message |
	self repository branch commit checkout.
	self assert: self repository head isDetached.
	
	message := 'Added IceGeneratedClassForTesting'.
	"This is a Ring working copy"
	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting' 
		inPackage: self packageName1 asSymbol.
			
	self should: [self repository commitWithMessage: message] raise: IceWorkingCopyDesyncronized.