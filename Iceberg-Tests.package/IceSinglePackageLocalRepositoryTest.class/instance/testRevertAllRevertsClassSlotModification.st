tests-revert
testRevertAllRevertsClassSlotModification

	| className class |
	className := 'IceGeneratedClassForTesting'.

	"This is a Ring working copy"
	self repository workingCopy
		createClass: className
		inPackage: self packageName1 asSymbol.

	self repository commitWithMessage: 'Added class'.

	class := self repository workingCopy
		environment ask behaviorNamed: className.
	class instanceVariables: #( slot ).
	(self repository workingCopy packageNamed: class package name)
		beDirty.

	self assert: ((self repository workingCopy
		environment ask behaviorNamed: className) instVarNames includes: #slot).
	self workingCopy discardChanges.
	self deny: ((self repository workingCopy
		environment ask behaviorNamed: className) instVarNames includes: #slot).