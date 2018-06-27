tests-revert
testRevertSingleDefinitionRevertsMethodAddition

	| className |
	className := 'IceGeneratedClassForTesting'.

	"This is a Ring working copy"
	self repository workingCopy
		createClass: className
		inPackage: self packageName1 asSymbol.

	self repository commitWithMessage: 'Added class'.

	self repository workingCopy
		createMethod: 'method' inClass: className.

	self assertMethodExists: 'method' inClass: className.
	self workingCopy discardChanges: (self repository workingCopyDiff codeSubdirectoryNode / self packageName1 / className / 'method').
	self denyMethodExists: 'method' inClass: className.