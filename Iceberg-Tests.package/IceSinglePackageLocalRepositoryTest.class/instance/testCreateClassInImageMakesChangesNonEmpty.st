tests-changes
testCreateClassInImageMakesChangesNonEmpty

	"This is a Ring working copy"
	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting' 
		inPackage: self packageName1 asSymbol.
	self deny: self repository workingCopyDiff isEmpty