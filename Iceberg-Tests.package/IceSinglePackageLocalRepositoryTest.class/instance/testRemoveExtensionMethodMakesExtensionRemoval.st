tests-changes
testRemoveExtensionMethodMakesExtensionRemoval

	| diff |
	"This is a Ring working copy"
	self repository workingCopy environment ensureClassNamed: #ToBeExtended.
	self repository workingCopy
		createMethod: 'method ^ 42'
		extendingClass: #ToBeExtended
		inPackage: self packageName1 asSymbol.
	
	self repository commitWithMessage: 'Added extension method'.
		
	"Remove extension method without modifying working copy packages."
	self repository workingCopy
		removeMethod: #method
		extendingClass: #ToBeExtended
		fromPackage: self packageName1 asSymbol.

	diff := self repository workingCopyDiff.
	self assert: diff codeSubdirectoryNode children size equals: 1.
	self assert: (diff codeSubdirectoryNode / self packageName1) children size equals: 1.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'ToBeExtended') value isRemoval.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'ToBeExtended') value definition isExtensionDefinition.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'ToBeExtended' / 'method') value isRemoval.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'ToBeExtended' / 'method') value definition isMethodDefinition.