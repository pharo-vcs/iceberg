tests-changes
testCreateClassInImageMakesRespositoryModifications

	"This is a Ring working copy"
	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting' 
		inPackage: self packageName1 asSymbol.
	self assert: self repository isModified