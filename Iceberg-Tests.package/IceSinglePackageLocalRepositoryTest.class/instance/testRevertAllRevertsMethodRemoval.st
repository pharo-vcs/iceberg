tests-revert
testRevertAllRevertsMethodRemoval

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
		removeMethod: 'method' fromClass: className.

	self denyMethodExists: 'method' inClass: className.
	self workingCopy discardChanges.
	self assertMethodExists: 'method' inClass: className.