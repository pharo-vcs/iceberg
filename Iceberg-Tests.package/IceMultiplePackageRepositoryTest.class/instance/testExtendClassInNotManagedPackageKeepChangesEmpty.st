tests-changes
testExtendClassInNotManagedPackageKeepChangesEmpty

	"This is a Ring working copy"
	self repository workingCopy
		createClass: 'IceAnotherGeneratedClassForTesting'
		inPackage: self packageName1 asSymbol.
	self repository commitWithMessage: 'Add class'.	
	
	self repository workingCopy
		createMethod: 'extension ^ self'
		extendingClass: 'IceAnotherGeneratedClassForTesting'
		inPackage: (self packageName1 , 'NotManaged') asSymbol.
	self assert: self repository workingCopyDiff isEmpty