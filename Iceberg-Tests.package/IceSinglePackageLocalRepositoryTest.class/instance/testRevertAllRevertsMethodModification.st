tests-revert
testRevertAllRevertsMethodModification

	| className |
	className := 'IceGeneratedClassForTesting'.

	"This is a Ring working copy"
	self repository workingCopy
		createClass: className
		inPackage: self packageName1 asSymbol.

	self repository workingCopy
		createMethod: 'method' inClass: className.

	self repository commitWithMessage: 'Added class'.

	self repository workingCopy
		createMethod: 'method ^ 42' inClass: className.

	self assertMethodExists: 'method' inClass: className.
	self
		assert: ((self repository workingCopy environment ask behaviorNamed: className) methodNamed: 'method') sourceCode
		equals: 'method ^ 42'.
	self workingCopy discardChanges.
	self assertMethodExists: 'method' inClass: className.
	self
		assert: ((self repository workingCopy environment ask behaviorNamed: className) methodNamed: 'method') sourceCode
		equals: 'method'