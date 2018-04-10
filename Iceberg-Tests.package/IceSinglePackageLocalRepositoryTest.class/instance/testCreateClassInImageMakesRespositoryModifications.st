tests-changes
testCreateClassInImageMakesRespositoryModifications

	"This is a Ring working copy"
	repository workingCopy
		createClass: 'IceGeneratedClassForTesting' 
		inPackage: packageName asSymbol.
	self assert: repository isModified