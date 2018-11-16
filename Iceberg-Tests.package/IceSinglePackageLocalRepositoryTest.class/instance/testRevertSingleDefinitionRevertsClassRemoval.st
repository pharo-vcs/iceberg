tests-revert
testRevertSingleDefinitionRevertsClassRemoval

	| className |
	className := 'IceGeneratedClassForTesting'.

	"This is a Ring working copy"
	self repository workingCopy
		createClass: className
		inPackage: self packageName1 asSymbol.

	self repository commitWithMessage: 'Added class'.

	self repository workingCopy
		removeClassNamed: className.

	self denyClassExists: className.
	self workingCopy discardChanges: (self repository workingCopyDiff codeSubdirectoryNode / self packageName1 / className).
	self assertClassExists: className.