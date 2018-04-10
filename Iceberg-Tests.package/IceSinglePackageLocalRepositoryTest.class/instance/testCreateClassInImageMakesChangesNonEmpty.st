tests-changes
testCreateClassInImageMakesChangesNonEmpty

	"This is a Ring working copy"
	repository workingCopy
		createClass: 'IceGeneratedClassForTesting' 
		inPackage: packageName asSymbol.
	self deny: repository workingCopyDiff isEmpty