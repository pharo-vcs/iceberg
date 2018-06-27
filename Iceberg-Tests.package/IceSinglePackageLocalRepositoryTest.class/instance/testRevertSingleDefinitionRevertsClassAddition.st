tests-revert
testRevertSingleDefinitionRevertsClassAddition

	| className |
	className := 'IceGeneratedClassForTesting'.

	"This is a Ring working copy"
	self repository workingCopy
		createClass: className
		inPackage: self packageName1 asSymbol.

	self assertClassExists: className.
	self workingCopy discardChanges: (self repository workingCopyDiff codeSubdirectoryNode / self packageName1 / className).
	self denyClassExists: className.