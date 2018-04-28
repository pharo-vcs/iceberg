tests-revert
testRevertAllRevertsClassAddition

	| className |
	className := 'IceGeneratedClassForTesting'.

	"This is a Ring working copy"
	self repository workingCopy
		createClass: className
		inPackage: self packageName1 asSymbol.

	self assertClassExists: className.
	self workingCopy discardChanges.
	self denyClassExists: className.