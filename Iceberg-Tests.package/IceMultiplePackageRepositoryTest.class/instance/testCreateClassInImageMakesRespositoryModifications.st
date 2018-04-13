tests-changes
testCreateClassInImageMakesRespositoryModifications

	"This is a Ring working copy"
	repository workingCopy
		createClass: 'IceAnotherGeneratedClassForTesting' 
		inPackage: self packageName1 asSymbol.
	self assert: repository isModified