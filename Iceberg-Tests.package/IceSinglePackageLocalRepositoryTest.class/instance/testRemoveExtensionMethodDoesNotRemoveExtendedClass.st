tests-changes
testRemoveExtensionMethodDoesNotRemoveExtendedClass

	| commitWithExtension commitWithoutExtension |
	"This is a Ring working copy"
	self repository workingCopy environment ensureClassNamed: #ToBeExtended.
	self repository workingCopy
		createMethod: 'method ^ 42'
		extendingClass: #ToBeExtended
		inPackage: self packageName1 asSymbol.
	
	commitWithExtension := self repository commitWithMessage: 'Added extension method'.
		
	"Remove extension method without modifying working copy packages."
	self repository workingCopy
		removeMethod: #method
		extendingClass: #ToBeExtended
		fromPackage: self packageName1 asSymbol.

	commitWithoutExtension := self repository commitWithMessage: 'Added extension method'.
	
	"Go to the commit with the extension and come back to the one without."
	commitWithExtension checkout.
	commitWithoutExtension checkout.
	
	self assertClassExists: #ToBeExtended