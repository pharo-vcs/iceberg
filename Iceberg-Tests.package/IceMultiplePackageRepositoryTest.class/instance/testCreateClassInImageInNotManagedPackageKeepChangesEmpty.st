tests-changes
testCreateClassInImageInNotManagedPackageKeepChangesEmpty

	"This is a Ring working copy"
	self repository workingCopy
		createClass: 'IceAnotherGeneratedClassForTesting' 
		inPackage: (self packageName1 , 'NonManaged') asSymbol.
	self assert: self repository workingCopyDiff isEmpty